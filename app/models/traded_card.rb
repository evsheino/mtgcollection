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
  validates :number, exclusion: { in: [0] }

  def to_s
    "#{printing} #{number}"
  end
end
