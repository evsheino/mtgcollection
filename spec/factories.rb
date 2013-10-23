FactoryGirl.define do
  factory :user do
    username "Pekka"
    password "foobar1"
    password_confirmation "foobar1"
  end

  factory :expansion do
    name 'Alpha'
    code 'LEA'
  end

  factory :card do
    name 'Grey Ogre'
    expansions {[FactoryGirl.create(:expansion)]}
  end

  factory :printing do
    card
    expansion
  end
end