require "spec_helper"

describe MtgDbCardsController do
  describe "routing" do

    it "routes to #index" do
      get("/mtg_db_cards").should route_to("mtg_db_cards#index")
    end

    it "routes to #new" do
      get("/mtg_db_cards/new").should route_to("mtg_db_cards#new")
    end

    it "routes to #show" do
      get("/mtg_db_cards/1").should route_to("mtg_db_cards#show", :id => "1")
    end

    it "routes to #edit" do
      get("/mtg_db_cards/1/edit").should route_to("mtg_db_cards#edit", :id => "1")
    end

    it "routes to #create" do
      post("/mtg_db_cards").should route_to("mtg_db_cards#create")
    end

    it "routes to #update" do
      put("/mtg_db_cards/1").should route_to("mtg_db_cards#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/mtg_db_cards/1").should route_to("mtg_db_cards#destroy", :id => "1")
    end

  end
end
