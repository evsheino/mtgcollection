cards = 1000
expansions = 50
printings_per_card = 5

(1..expansions).each do |i|
  Expansion.create :name => "expansion_#{i}", code: "#{i}"
end

(1..cards).each do |i|
  e = Expansion.where(id: Expansion.pluck(:id).sample(printings_per_card))
  c = Card.create :name => "card_#{i}", code: "#{i}"
  (1..printings_per_card).each do |n|
    Printing.create card: c, expansion: e[n]
  end
end
