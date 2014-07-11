class Expansion < ActiveRecord::Base
  has_many :printings, dependent: :destroy
  has_many :cards, through: :printings

  validates_length_of :code, minimum: 1
  validates_uniqueness_of :code

  def to_s
    code
  end
end
