class OwnedCard < ActiveRecord::Base
  belongs_to :printing
  belongs_to :user
  has_one :card, through: :printing
  has_one :expansion, through: :printing

  validates_numericality_of :number, greater_than: 0, only_integer: true
  validates_uniqueness_of :printing_id, scope: [:user_id, :foil, :signed, :altered]

  def self.add_from_mtg_db_card(card, user, amount=1)
    printing = Printing.find_or_create_from_mtg_db_card(card)

    owned_card = find_or_initialize_by(printing: printing, user: user)
    owned_card.number = 0 if owned_card.number.nil?
    owned_card.number += amount
    owned_card.save!

    owned_card
  end

  def to_s
    "#{card}, owned by #{user}"
  end
end
