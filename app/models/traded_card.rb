class TradedCard < ActiveRecord::Base
  belongs_to :trade
  belongs_to :printing

  def to_s
    "#{printing} #{number}"
  end
end
