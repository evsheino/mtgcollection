class OwnedCardDecorator < ApplicationDecorator
  delegate_all

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

end
