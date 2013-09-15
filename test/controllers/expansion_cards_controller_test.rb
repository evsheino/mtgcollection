require 'test_helper'

class ExpansionCardsControllerTest < ActionController::TestCase
  setup do
    @expansion_card = expansion_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expansion_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expansion_card" do
    assert_difference('ExpansionCard.count') do
      post :create, expansion_card: { card_id: @expansion_card.card_id, expansion_id: @expansion_card.expansion_id }
    end

    assert_redirected_to expansion_card_path(assigns(:expansion_card))
  end

  test "should show expansion_card" do
    get :show, id: @expansion_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expansion_card
    assert_response :success
  end

  test "should update expansion_card" do
    patch :update, id: @expansion_card, expansion_card: { card_id: @expansion_card.card_id, expansion_id: @expansion_card.expansion_id }
    assert_redirected_to expansion_card_path(assigns(:expansion_card))
  end

  test "should destroy expansion_card" do
    assert_difference('ExpansionCard.count', -1) do
      delete :destroy, id: @expansion_card
    end

    assert_redirected_to expansion_cards_path
  end
end
