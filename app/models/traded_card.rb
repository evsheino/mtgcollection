class TradedCard < ActiveRecord::Base
  belongs_to :trade
  belongs_to :printing

  scope :mine, -> { where('number > 0')}
  scope :theirs, -> { where('number < 0')}

  validates_presence_of :trade
  validates_presence_of :printing

  def to_s
    "#{printing} #{number}"
  end
end
