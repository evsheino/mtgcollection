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
  end

  factory :printing do
    card
    expansion
    sequence(:multiverse_id, 1)
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
    initialize_with {
      new(
        {
            "id" => 1,
            "relatedCardId" => 0,
            "setNumber" => 6,
            "name" => "Ankh of Mishra",
            "searchName" => "ankhofmishra",
            "description" => "Whenever a land enters the battlefield, Ankh of Mishra deals 2 damage to that land's controller.",
            "flavor" => "",
            "colors" => [
                "None"
            ],
            "manaCost" => "2",
            "convertedManaCost" => 2,
            "cardSetName" => "Limited Edition Alpha",
            "type" => "Artifact",
            "subType" => nil,
            "power" => 0,
            "toughness" => 0,
            "loyalty" => 0,
            "rarity" => "Rare",
            "artist" => "Amy Weber",
            "cardSetId" => "LEA",
            "token" => false,
            "promo" => false,
            "rulings" => [
                {
                    "releasedAt" => "2004-10-04",
                    "rule" => "This triggers on any land entering the battlefield. This includes playing a land or putting a land onto the battlefield using a spell or ability."
                },
                {
                    "releasedAt" => "2004-10-04",
                    "rule" => "It determines the land's controller at the time the ability resolves. If the land leaves the battlefield before the ability resolves, the land's last controller before it left is used."
                }
            ],
            "formats" => [
                {
                    "name" => "Legacy",
                    "legality" => "Legal"
                },
                {
                    "name" => "Vintage",
                    "legality" => "Legal"
                },
                {
                    "name" => "Freeform",
                    "legality" => "Legal"
                },
                {
                    "name" => "Prismatic",
                    "legality" => "Legal"
                },
                {
                    "name" => "Tribal Wars Legacy",
                    "legality" => "Legal"
                },
                {
                    "name" => "Classic",
                    "legality" => "Legal"
                },
                {
                    "name" => "Singleton 100",
                    "legality" => "Legal"
                },
                {
                    "name" => "Commander",
                    "legality" => "Legal"
                }
            ],
            "releasedAt" => "1993-08-05"
        }
      )
    }
  end
end
