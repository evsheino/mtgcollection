# This file is copied to spec/ when you run 'rails generate rspec:install'

require 'simplecov'
SimpleCov.start

require 'webmock/rspec'

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    stub_request(:get, "http://api.mtgdb.info//cards/1")
         .to_return(:status => 200,
                    :body => '{"id":1,"relatedCardId":0,"setNumber":6,"name":"Ankh of Mishra","searchName":"ankhofmishra","description":"Whenever a land enters the battlefield, Ankh of Mishra deals 2 damage to that land\'s controller.","flavor":"","colors":["None"],"manaCost":"2","convertedManaCost":2,"cardSetName":"Limited Edition Alpha","type":"Artifact","subType":null,"power":0,"toughness":0,"loyalty":0,"rarity":"Rare","artist":"Amy Weber","cardSetId":"LEA","token":false,"promo":false,"rulings":[{"releasedAt":"2004-10-04","rule":"This triggers on any land entering the battlefield. This includes playing a land or putting a land onto the battlefield using a spell or ability."},{"releasedAt":"2004-10-04","rule":"It determines the land\'s controller at the time the ability resolves. If the land leaves the battlefield before the ability resolves, the land\'s last controller before it left is used."}],"formats":[{"name":"Legacy","legality":"Legal"},{"name":"Vintage","legality":"Legal"},{"name":"Freeform","legality":"Legal"},{"name":"Prismatic","legality":"Legal"},{"name":"Tribal Wars Legacy","legality":"Legal"},{"name":"Classic","legality":"Legal"},{"name":"Singleton 100","legality":"Legal"},{"name":"Commander","legality":"Legal"}],"releasedAt":"1993-08-05"}', 
                    :headers => {'Content-Type' => 'application/json'})

    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
end
