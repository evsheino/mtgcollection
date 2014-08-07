class Printing < ActiveRecord::Base
  belongs_to :card
  belongs_to :expansion
  has_many :owned_cards
  has_many :users, through: :owned_cards

  validates_uniqueness_of :card_id, scope: :expansion_id
  validates :multiverse_id, presence: true, uniqueness: true

  # Do a text search by card name
  def self.search_by_name(search)
    if search
      joins(:card).joins(:expansion).where("cards.name LIKE ?", "%#{search.strip}%")
    else
      all
    end
  end

  # Do a text search by expansion name
  def self.search_by_expansion(search)
    if search
      joins(:expansion).joins(:card).where("expansions.name LIKE ?", "%#{search.strip}%")
    else
      all
    end
  end

  def self.search(name, expansion)
    if name || expansion
      result = joins(:card).joins(:expansion).
          where("cards.name LIKE ? AND expansions.name LIKE ?", "%#{name.strip}%", "%#{expansion.strip}%")
    else
      result = all
    end
    result.includes(:expansion, :card)
  end

  def self.find_or_create_from_mtg_db_card(mtg_db_card)
    printing = find_by(multiverse_id: mtg_db_card.id)
    return printing unless printing.nil?

    expansion = Expansion.find_or_create_by(code: mtg_db_card.cardSetId)
    card = Card.find_or_create_by(name: mtg_db_card.name)
    create(expansion: expansion, card: card, multiverse_id: mtg_db_card.id)
  end

  def to_s
    "#{card.name} (#{expansion.code})"
  end
end
