json.array!(@mtg_db_cards) do |mtg_db_card|
  json.extract! mtg_db_card, :id
  json.url mtg_db_card_url(mtg_db_card, format: :json)
end
