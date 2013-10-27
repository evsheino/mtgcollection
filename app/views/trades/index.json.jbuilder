json.array!(@trades) do |trade|
  json.extract! trade, :user_id, :partner, :date
  json.url trade_url(trade, format: :json)
end
