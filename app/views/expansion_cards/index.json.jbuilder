json.array!(@expansion_cards) do |expansion_card|
  json.extract! expansion_card, :card_id, :expansion_id
  json.url expansion_card_url(expansion_card, format: :json)
end
