require "spec_helper"

describe TradedCardsController do
  describe "routing" do

    it "routes to #index" do
      get("/traded_cards").should route_to("traded_cards#index")
    end

    it "routes to #new" do
      get("/traded_cards/new").should route_to("traded_cards#new")
    end

    it "routes to #show" do
      get("/traded_cards/1").should route_to("traded_cards#show", :id => "1")
    end

    it "routes to #edit" do
      get("/traded_cards/1/edit").should route_to("traded_cards#edit", :id => "1")
    end

    it "routes to #create" do
      post("/traded_cards").should route_to("traded_cards#create")
    end

    it "routes to #update" do
      put("/traded_cards/1").should route_to("traded_cards#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/traded_cards/1").should route_to("traded_cards#destroy", :id => "1")
    end

  end
end
