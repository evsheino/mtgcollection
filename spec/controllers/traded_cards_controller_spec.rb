require 'spec_helper'

describe TradedCardsController do
  let(:user) { FactoryGirl.create(:user) }
  let(:trade) { FactoryGirl.create(:trade, user: user) }
  let(:printing) { FactoryGirl.create(:printing) }

  # This should return the minimal set of attributes required to create a valid
  # TradedCard. As you add validations to TradedCard, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { trade_id: trade.id, printing_id: printing.id, number: 1 } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TradedCardsController. Be sure to keep this updated too.
  let(:valid_session) { { user_id: user.id } }

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
        puts valid_attributes
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
