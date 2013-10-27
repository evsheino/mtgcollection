class TradedCard < ActiveRecord::Base
  belongs_to :trade
  belongs_to :printing
end
