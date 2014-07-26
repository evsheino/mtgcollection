json.array!(@loans) do |loan|
  json.extract! loan, :id, :owner_id, :borrower_id, :owned_card_id, :number, :note
  json.url loan_url(loan, format: :json)
end
