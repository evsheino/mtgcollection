class Trade < ActiveRecord::Base
  belongs_to :user
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
end
