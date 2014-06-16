require 'mtgdb_api'

class Printing < ActiveRecord::Base
  belongs_to :card
  belongs_to :expansion
  has_many :owned_cards
  has_many :users, through: :owned_cards

  validates_uniqueness_of :card_id, scope: :expansion_id
  validates_uniqueness_of :multiverse_id

  # Do a text search by card name
  def self.search_by_name(search)
    if search && search != ""
      l = MtgDbAPI.search_by_name(search)
      l.map { |x| 
        Printing.new(card: Card.new(name: x['name']), 
                     expansion: Expansion.new(name: x['cardSetId'])) }
      .sort! { |a,b| a.card.name <=> b.card.name }
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
    name = nil if name == ''
    expansion = nil if expansion == ''

    cards = []
    if name
      cards = search_by_name(name)
    elsif expansion
      return MtgDbAPI.cards_in_expansion_by_id(expansion)
      .map { |x| Printing.new(card: Card.new(name: x['name']), 
                     expansion: Expansion.new(name: x['cardSetId'])) }
      .sort! { |a,b| a.card.name <=> b.card.name }
    end

    if cards && expansion
      cards = cards.select! { |x| x.expansion.name == expansion }
    end

    cards
  end

  def to_s
    "#{card.name} (#{expansion.name})"
  end
end
