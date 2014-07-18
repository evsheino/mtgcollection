class MtgDbCardDecorator < ApplicationDecorator
  delegate_all

  def owned
    object.amount_owned(h.current_user)
  end

end
