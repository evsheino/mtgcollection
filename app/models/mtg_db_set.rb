require 'mtgdb_api'

class MtgDbSet

  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :id, :name, :type, :block, :description, :common, :uncommon, :description,
                :rare, :mythicRare, :basicLand, :total, :releasedAt, :cardIds

  # Define find so that this acts like a normal model in this regard.
  def self.find(id)
    new(MtgDbAPI.expansion_by_id(id))
  end

  def self.all
    MtgDbAPI.all_expansions
  end

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def cards
    MtgDbAPI.cards_in_expansion_by_id(id)
  end

  def persisted?
    true
  end

  def to_s
    "#{name} (#{id})"
  end
end
