require 'spec_helper'

describe MtgDbCardsController do
  let(:user) { FactoryGirl.create(:user) }

  # This should return the minimal set of attributes required to create a valid
  # MtgDbCard. As you add validations to MtgDbCard, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MtgDbCardsController. Be sure to keep this updated too.
  let(:valid_session) { { user_id: user.id } }

  describe "GET index" do
    it "initially displays no cards" do
      get :index, {}, valid_session
      assigns(:cards).should eq([])
    end
  end

  describe "GET show" do
    it "assigns the requested mtg_db_card as @mtg_db_card" do
      get :show, {:id => mtg_db_card.to_param}, valid_session
      assigns(:mtg_db_card).should eq(mtg_db_card)
    end
  end

end
