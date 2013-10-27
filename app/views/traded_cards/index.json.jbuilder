json.array!(@traded_cards) do |traded_card|
  json.extract! traded_card, :trade_id, :printing_id, :foil, :number
  json.url traded_card_url(traded_card, format: :json)
end
