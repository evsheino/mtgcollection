class Printing < ActiveRecord::Base
  belongs_to :card
  belongs_to :expansion
  has_many :owned_cards
  has_many :users, through: :owned_cards

  validates_uniqueness_of :card_id, scope: :expansion_id
  validates_uniqueness_of :multiverse_id

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

  def to_s
    "#{card.name} (#{expansion.name})"
  end
end
