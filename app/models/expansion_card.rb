class ExpansionCard < ActiveRecord::Base
  belongs_to :card
  belongs_to :expansion

  def to_s
    "#{card.name} (#{expansion.name})"
  end
end
