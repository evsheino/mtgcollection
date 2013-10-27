class Trade < ActiveRecord::Base
  belongs_to :user
  has_many :traded_cards
  has_many :printings, through: :traded_cards
  has_many :cards, through: :printings
end
