class OwnedCardDecorator < ApplicationDecorator
  delegate_all

  def name
    name = object.card
    name += " *FOIL*" if object.foil
  end

  def foil
    pretty_boolean(object.foil)
  end

  def signed
    pretty_boolean(object.signed)
  end

  def altered
    pretty_boolean(object.altered)
  end

  def pretty_boolean(bool)
    'X' if bool
  end

  def available
    number = object.amount_available
    if number == 0 then nil else number end
  end

  def owned_and_available
    o = object.number
    a = available
    if a != o
      "#{o || 0} (#{a})"
    else
      o
    end
  end

end
