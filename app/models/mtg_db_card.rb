require 'mtgdb_api'

class MtgDbCard

  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :id, :relatedCardId, :setNumber, :name, :searchName, :description,
                :flavor, :colors, :manaCost, :convertedManaCost, :cardSetName,
                :type, :subType, :power, :toughness, :loyalty, :rarity, :artist,
                :cardSetId, :token, :promo, :rulings, :formats, :releasedAt

  def self.search(name, expansion)
    MtgDbAPI.search(name, expansion)
  end

  def self.find(id)
    new(MtgDbAPI.card_by_id(id))
  end

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def creature?
    @type == 'Creature'
  end

  def planeswalker?
    @type == 'Planeswalker'
  end

  def persisted?
    false
  end
end
