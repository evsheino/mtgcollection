class Expansion < ActiveRecord::Base
  has_many :expansion_cards, dependent: :destroy
  has_many :cards, through: :expansion_cards

  validates_length_of :name, minimum: 1

  def to_s
    name
  end
end
