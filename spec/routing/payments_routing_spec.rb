require "spec_helper"

describe PaymentsController do
  describe "routing" do

    it "routes to #create" do
      post("/payments").should route_to("payments#create")
    end

    it "routes to #update" do
      put("/payments/1").should route_to("payments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/payments/1").should route_to("payments#destroy", :id => "1")
    end

  end
end
