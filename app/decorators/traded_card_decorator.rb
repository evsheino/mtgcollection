class TradedCardDecorator < ApplicationDecorator
  delegate_all

  def amount
    object.number.abs
  end

  def delete_link
    h.raw(h.link_to 'Remove', h.traded_card_path(object.id), remote: true,
                method: :delete, class: 'btn btn-primary')
  end

  def to_s
    s = object.printing.to_s
    s += " signed" if object.signed
    s += " altered" if object.altered
    s += " foil" if object.foil
    s
  end

end
