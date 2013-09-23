class Card < ActiveRecord::Base
  has_many :expansion_cards, dependent: :destroy
  has_many :expansions, through: :expansion_cards
  has_many :owned_cards, through: :expansion_cards
  has_many :users, through: :owned_cards

  validates_uniqueness_of :name

  def to_s
    name
  end
end
