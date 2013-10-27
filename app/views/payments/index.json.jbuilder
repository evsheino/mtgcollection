json.array!(@payments) do |payment|
  json.extract! payment, :trade_id, :amount
  json.url payment_url(payment, format: :json)
end
