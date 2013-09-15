json.array!(@cards) do |card|
  json.extract! card, :name
  json.url card_url(card, format: :json)
end
