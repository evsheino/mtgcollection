class OwnedCard < ActiveRecord::Base
  belongs_to :expansion_card
  belongs_to :user
  has_one :card, through: :expansion_card
  has_one :expansion, through: :expansion_card

  validates_numericality_of :number, greater_than: 0
  validates_uniqueness_of :expansion_card_id, scope: :user_id

  def to_s
    "#{card}, owned by #{user}"
  end
end
