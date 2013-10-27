require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TradedCardsController do

  # This should return the minimal set of attributes required to create a valid
  # TradedCard. As you add validations to TradedCard, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "trade_id" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TradedCardsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all traded_cards as @traded_cards" do
      traded_card = TradedCard.create! valid_attributes
      get :index, {}, valid_session
      assigns(:traded_cards).should eq([traded_card])
    end
  end

  describe "GET show" do
    it "assigns the requested traded_card as @traded_card" do
      traded_card = TradedCard.create! valid_attributes
      get :show, {:id => traded_card.to_param}, valid_session
      assigns(:traded_card).should eq(traded_card)
    end
  end

  describe "GET new" do
    it "assigns a new traded_card as @traded_card" do
      get :new, {}, valid_session
      assigns(:traded_card).should be_a_new(TradedCard)
    end
  end

  describe "GET edit" do
    it "assigns the requested traded_card as @traded_card" do
      traded_card = TradedCard.create! valid_attributes
      get :edit, {:id => traded_card.to_param}, valid_session
      assigns(:traded_card).should eq(traded_card)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new TradedCard" do
        expect {
          post :create, {:traded_card => valid_attributes}, valid_session
        }.to change(TradedCard, :count).by(1)
      end

      it "assigns a newly created traded_card as @traded_card" do
        post :create, {:traded_card => valid_attributes}, valid_session
        assigns(:traded_card).should be_a(TradedCard)
        assigns(:traded_card).should be_persisted
      end

      it "redirects to the created traded_card" do
        post :create, {:traded_card => valid_attributes}, valid_session
        response.should redirect_to(TradedCard.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved traded_card as @traded_card" do
        # Trigger the behavior that occurs when invalid params are submitted
        TradedCard.any_instance.stub(:save).and_return(false)
        post :create, {:traded_card => { "trade_id" => "invalid value" }}, valid_session
        assigns(:traded_card).should be_a_new(TradedCard)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        TradedCard.any_instance.stub(:save).and_return(false)
        post :create, {:traded_card => { "trade_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested traded_card" do
        traded_card = TradedCard.create! valid_attributes
        # Assuming there are no other traded_cards in the database, this
        # specifies that the TradedCard created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        TradedCard.any_instance.should_receive(:update).with({ "trade_id" => "" })
        put :update, {:id => traded_card.to_param, :traded_card => { "trade_id" => "" }}, valid_session
      end

      it "assigns the requested traded_card as @traded_card" do
        traded_card = TradedCard.create! valid_attributes
        put :update, {:id => traded_card.to_param, :traded_card => valid_attributes}, valid_session
        assigns(:traded_card).should eq(traded_card)
      end

      it "redirects to the traded_card" do
        traded_card = TradedCard.create! valid_attributes
        put :update, {:id => traded_card.to_param, :traded_card => valid_attributes}, valid_session
        response.should redirect_to(traded_card)
      end
    end

    describe "with invalid params" do
      it "assigns the traded_card as @traded_card" do
        traded_card = TradedCard.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TradedCard.any_instance.stub(:save).and_return(false)
        put :update, {:id => traded_card.to_param, :traded_card => { "trade_id" => "invalid value" }}, valid_session
        assigns(:traded_card).should eq(traded_card)
      end

      it "re-renders the 'edit' template" do
        traded_card = TradedCard.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TradedCard.any_instance.stub(:save).and_return(false)
        put :update, {:id => traded_card.to_param, :traded_card => { "trade_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested traded_card" do
      traded_card = TradedCard.create! valid_attributes
      expect {
        delete :destroy, {:id => traded_card.to_param}, valid_session
      }.to change(TradedCard, :count).by(-1)
    end

    it "redirects to the traded_cards list" do
      traded_card = TradedCard.create! valid_attributes
      delete :destroy, {:id => traded_card.to_param}, valid_session
      response.should redirect_to(traded_cards_url)
    end
  end

end
