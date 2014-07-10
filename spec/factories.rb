FactoryGirl.define do

  factory :user do
    sequence(:username) { |n| "user#{n}" }
    password "foobar1"
    password_confirmation "foobar1"
  end

  factory :expansion do
    sequence(:name) { |n| "expansion#{n}" }
    sequence(:code) { |n| "#{n}".ljust(3, 'x')[0..2] }
  end

  factory :card do
    sequence(:name) { |n| "card#{n}" }
    expansions { [FactoryGirl.create(:expansion)] }
  end

  factory :printing do
    card
    expansion
  end

  factory :trade do
    user
    partner 'gg'
    date Date.new(2013, 1, 1)
  end

  factory :payment do
    trade
    amount -10
  end

  factory :mtg_db_card do
    skip_create
    id 1
  end

end
