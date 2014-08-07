# Represents a card that is involved in a trade.
class TradedCard < ActiveRecord::Base
  extend FormValueTypeCaster

  belongs_to :trade
  belongs_to :printing

  # If number < 0, the card has been traded away.
  scope :mine, -> { where('number < 0') }
  # If number > 0, the card has been received in the trade.
  scope :theirs, -> { where('number > 0') }

  validates_presence_of :trade
  validates_presence_of :printing
  validates_numericality_of :number, only_integer: true
  validates :number, exclusion: { in: [0] }
  validates_uniqueness_of :printing_id, scope: [:trade_id, :foil, :signed, :altered]

  # Find the record with the attributes given (excluding number) or initialize a new one if not found.
  # Then increment the number with the number in the given attributes and return the record (without saving).
  def self.increment_number_or_initialize(attributes)
    number = attributes[:number].to_i
    card = find_or_initialize_by(attributes.except(:number)) do |c|
      c.number = 0
    end
    card.number += number
    card
  end

  # Find a card owned by the trade's user that has the same attributes (except some) as this
  # if one exists. Otherwise return a new owned card (with number = 0).
  def to_corresponding_owned_card
    excluded_attrs = ['id', 'created_at', 'updated_at', 'trade_id', 'number']

    trade.user.owned_cards.find_or_initialize_by(attributes.except(*excluded_attrs)) do |card|
      card.number = 0
    end
  end

  def to_s
    "#{printing} #{number}"
  end
end
