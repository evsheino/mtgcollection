class OwnedCard < ActiveRecord::Base
  belongs_to :printing
  belongs_to :user
  has_one :card, through: :printing
  has_one :expansion, through: :printing
  has_many :loans, through: :printing

  validates_numericality_of :number, greater_than: 0, only_integer: true
  validates_uniqueness_of :printing_id, scope: [:user_id, :foil, :signed, :altered]

  def self.add_or_update_from_mtg_db_card(card, user, amount)
    printing = Printing.find_or_create_from_mtg_db_card(card)

    owned_card = find_or_initialize_by(printing: printing, user: user)
    owned_card.number = 0 if owned_card.number.nil?
    owned_card.number += amount

    if owned_card.number == 0
      owned_card.delete
    else
      owned_card.save!
    end

    owned_card
  end

  def self.search_by_card_name_and_user_id(name, user_id)
    if name
      joins(:printing).joins(:card)
          .where('cards.name LIKE ? AND owned_cards.user_id = ?', "%#{name.strip}%", user_id)
    end
  end

  def self.search_by_expansion_and_user_id(expansion, user_id)
    if expansion
      joins(:printing).joins(:card)
          .where('expansion.code LIKE ? AND owned_cards.user_id = ?', "%#{expansion.strip}%", user_id)
    end
  end

  def self.search(card_name, expansion, user_id)
    card_name = nil if card_name == ''
    expansion = nil if expansion == ''

    if card_name && !expansion
      return search_by_card_name_and_user_id(card_name, user_id)
    elsif expansion && !card_name
      return search_by_expansion_and_user_id(expansion, user_id)
    elsif card_name && expansion
      joins(:printing).joins(:card).joins(:expansion)
          .where('expansion.code LIKE ? AND cards.name LIKE ? AND owned_cards.user_id = ?',
                 "%#{expansion.strip}%", "%#{card_name.strip}%", "%#{user_id}%")
    end
  end

  def loaned
    user.loans.where(printing_id: printing_id)
  end

  def borrowed
    user.borrowings.where(printing_id: printing_id)
  end

  def amount_available
    number - loaned.sum(:number) + borrowed.sum(:number)
  end

  def to_s
    "#{card}, owned by #{user}"
  end
end
