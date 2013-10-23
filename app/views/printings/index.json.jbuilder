json.array!(@printings) do |printing|
  json.extract! printing, :card_id, :expansion_id
  json.url printing_url(printing, format: :json)
end
