class Payment < ActiveRecord::Base
  belongs_to :trade

  scope :mine, -> { where('amount < 0') }
  scope :theirs, -> { where('amount > 0') }

  validates_presence_of :trade
  validates_uniqueness_of :trade_id

  # Find the record with the attributes given (excluding amount) or initialize a new one if not found.
  # Then increment the amount with the amount in the given attributes and return the record (without saving).
  def self.increment_amount_or_initialize(attributes)
    amount = attributes[:amount].to_f
    payment = find_or_initialize_by(attributes.except(:amount)) do |p|
      p.amount = 0
    end
    payment.amount += amount
    payment
  end

  def to_s
    "#{amount}"
  end
end
