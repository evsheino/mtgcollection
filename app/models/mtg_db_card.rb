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

  # Define find so that this acts like a normal model in this regard.
  def self.find(id)
    new(MtgDbAPI.card_by_id(id))
  end

  def card_list
    printings = Printing.includes(:card, :expansion)
    list = printings.reduce([]) {
        |r, e| r << {
          value: e.to_s,
          id: e.id,
          tokens: e.card.name.split(),
          expansion: e.expansion.name
      }
    }
    respond_to do |format|
      format.json {render json: list}
    end
  end

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def amount_owned(user)
    owned_card = OwnedCard.joins(:printing)
      .find_by('printings.multiverse_id' => @id, user_id: user.id)
    owned_card.number unless owned_card.nil?
  end

  def creature?
    @type == 'Creature'
  end

  def planeswalker?
    @type == 'Planeswalker'
  end

  def persisted?
    true
  end

  def to_s
    "#{name} (#{cardSetId})"
  end
end
