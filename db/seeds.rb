cards = 1000
expansions = 50
printings_per_card = 5

(1..expansions).each do |i|
  Expansion.create :name => "expansion_#{i}", code: "#{i}"
end

e_ids = Expansion.pluck(:id)

(1..cards).each do |i|
  e = Expansion.where(id: e_ids.sample(printings_per_card))
  c = Card.new :name => "card_#{i}"
  (0..printings_per_card-1).each do |n|
    c.expansions << e[n]
  end
  c.save
end
