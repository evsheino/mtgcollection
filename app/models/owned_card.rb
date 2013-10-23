class OwnedCard < ActiveRecord::Base
  belongs_to :printing
  belongs_to :user
  has_one :card, through: :printing
  has_one :expansion, through: :printing

  validates_numericality_of :number, greater_than: 0
  validates_uniqueness_of :printing_id, scope: :user_id

  def to_s
    "#{card}, owned by #{user}"
  end
end
