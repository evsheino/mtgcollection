class MtgDbCardDecorator < ApplicationDecorator
  delegate_all

  def owned
    number = object.amount_owned(h.current_user)
    if number == 0 then nil else number end
  end

  def available
    number = object.amount_available(h.current_user)
    if number == 0 then nil else number end
  end

  def owned_and_available
    o = owned
    a = available
    if a != o
      "#{o || 0} (#{a})"
    else
      o
    end
  end

end
