class Trade < ActiveRecord::Base
  belongs_to :user
  has_many :payments
  has_many :traded_cards
  has_many :printings, through: :traded_cards
  has_many :cards, through: :printings

  validates_presence_of :user

  def my_cards
    traded_cards.mine
  end

  def their_cards
    traded_cards.theirs
  end

  # Adds a new payment or updates the existing one.
  def add_payment(amount)
    payment = payments.first
    if payment.nil?
      payments << Payment.new(amount: amount)
    else
      payment.amount += amount
      payment.save
    end
  end

  def execute(force=false)
    return false if closed && !force
    update_user_collection
    self.closed = true
    save
  end

  # Remove cards traded away in the trade from the user's collection and add cards received in the trade.
  # Cards traded away which are not found in the user's collection are ignored.
  def update_user_collection
    traded_cards.includes(:trade).each do |traded_card|
      owned_card = traded_card.to_corresponding_owned_card

      owned_card.number += traded_card.number
      if owned_card.number < 1
        owned_card.destroy if owned_card.persisted?
      else
        owned_card.save
      end
    end
  end

end
