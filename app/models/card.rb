class Card < ActiveRecord::Base
  has_many :expansion_cards, dependent: :destroy
  has_many :expansions, through: :expansion_cards

  def to_s
    name
  end
end
