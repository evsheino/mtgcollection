class OwnedCard < ActiveRecord::Base
  belongs_to :expansion_card
  belongs_to :user

  def to_s
    "#{expansion_card}, owned by #{user}"
  end
end
