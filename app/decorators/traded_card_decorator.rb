class TradedCardDecorator < Draper::Decorator
  delegate_all

  def amount
    object.number.abs
  end

  def delete_link
    h.raw(h.link_to 'Remove', h.delete_card_trade_path(id), remote: true,
                method: :delete, class: 'btn btn-primary')
  end

  def to_s
    object.printing
  end

end
