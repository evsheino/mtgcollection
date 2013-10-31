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

  def add_card(printing_id, number)
    card = traded_cards.find_or_initialize_by(printing_id: printing_id) do |c|
      c.number = 0
    end
    card.number += number
    card.save
  end

  def add_payment(amount)
    payment = payments.first
    if payment.nil?
      payments << Payment.new(amount: amount)
    else
      payment.amount += amount
      payment.save
    end
  end
end
