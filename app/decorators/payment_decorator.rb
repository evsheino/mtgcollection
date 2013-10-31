class PaymentDecorator < Draper::Decorator
  delegate_all

  def amount
    object.amount.abs
  end

  def delete_link
    h.raw(h.link_to 'Remove', h.payment_path(object.id), remote: true,
                method: :delete, class: 'btn btn-primary')
  end

  def to_s
    'Money'
  end

end
