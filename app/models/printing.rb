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

  # Find cards by (exact) expansion
  def self.find_by_expansion(expansion)
      MtgDbAPI.cards_in_expansion_by_id(expansion)
          .map { |x| Printing.new(card: Card.new(name: x['name']), 
                         expansion: Expansion.new(name: x['cardSetId'])) }
          .sort! { |a,b| a.card.name <=> b.card.name }
  end

  # Search by card name and expansion.
  # If either is blank, only the other is used.
  def self.search(name, expansion)
    name = nil if name == ''
    expansion = expansion == '' ? nil : expansion.upcase

    cards = []
    if name
      cards = search_by_name(name)
    elsif expansion
      return find_by_expansion(expansion)
    end

    if cards && expansion
      cards.select! { |x| x.expansion.name == expansion }
    end

    cards || []
  end

  def to_s
    "#{card.name} (#{expansion.name})"
  end
end
