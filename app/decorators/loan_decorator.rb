class LoanDecorator < ApplicationDecorator
  delegate_all

  def card
    name = object.printing.to_s
    name += " *FOIL*" if object.foil
    name
  end

  def owner
    if object.owner then object.owner else object.owner_name end
  end

  def borrower
    if object.borrower then object.borrower else object.borrower_name end
  end

end
