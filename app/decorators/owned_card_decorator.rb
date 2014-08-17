class OwnedCardDecorator < ApplicationDecorator
  delegate_all

  def name
    "#{object.card}#{' *FOIL*' if object.foil}"
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

  def owned_and_available
    object.number
  end

end
