# Represents a card that is involved in a trade.
class TradedCard < ActiveRecord::Base
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
  validates_uniqueness_of :printing_id, scope: [:trade_id, :foil]

  def self.initialize_or_update(attributes)
    number = attributes[:number].to_i
    card = find_or_initialize_by(attributes.except(:number)) do |c|
      c.number = 0
    end
    card.number += number
    card
  end

  def to_s
    "#{printing} #{number}"
  end
end
