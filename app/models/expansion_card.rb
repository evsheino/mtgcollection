class ExpansionCard < ActiveRecord::Base
  belongs_to :card
  belongs_to :expansion
  has_many :owned_cards
  has_many :users, through: :owned_cards

  def to_s
    "#{card.name} (#{expansion.name})"
  end
end
