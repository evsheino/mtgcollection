class Expansion < ActiveRecord::Base
  has_many :expansion_cards, dependent: :destroy
  has_many :cards, through: :expansion_cards

  def to_s
    name
  end
end
