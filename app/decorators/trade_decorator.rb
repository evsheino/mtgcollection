class TradeDecorator < ApplicationDecorator
  delegate_all
  decorates_associations :traded_cards, :payments

  def my_side
    @list = object.traded_cards.mine.decorate.reduce([]) { |r, e| r << e }
    object.payments.mine.decorate.reduce(@list) { |r, e| r << e }
  end

  def their_side
    @list = object.traded_cards.theirs.decorate.reduce([]) { |r, e| r << e }
    object.payments.theirs.decorate.reduce(@list) { |r, e| r << e }
  end

end
