json.array!(@expansions) do |expansion|
  json.extract! expansion, :name
  json.url expansion_url(expansion, format: :json)
end
