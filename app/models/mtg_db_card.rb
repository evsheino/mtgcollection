class MtgDbCard
  attr_accessor :id, :relatedCardId, :setNumber, :name, :searchName, :description,
                :flavor, :colors, :manaCost, :convertedManaCost, :cardSetName,
                :type, :subType, :power, :toughness, :loyalty, :rarity, :artist,
                :cardSetId, :token, :promo, :rulings, :formats, :releasedAt

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
end
