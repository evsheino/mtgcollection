json.array!(@owned_cards) do |owned_card|
  json.extract! owned_card, :expansion_card_id, :user_id, :number
  json.url owned_card_url(owned_card, format: :json)
end
