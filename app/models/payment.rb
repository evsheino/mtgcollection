class Payment < ActiveRecord::Base
  belongs_to :trade

  scope :mine, -> { where('amount < 0') }
  scope :theirs, -> { where('amount > 0') }

  validates_presence_of :trade
  validates_uniqueness_of :trade_id

  def to_s
    "#{amount}"
  end
end
