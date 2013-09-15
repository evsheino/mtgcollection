require 'test_helper'

class OwnedCardsControllerTest < ActionController::TestCase
  setup do
    @owned_card = owned_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:owned_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create owned_card" do
    assert_difference('OwnedCard.count') do
      post :create, owned_card: { expansion_card_id: @owned_card.expansion_card_id, number: @owned_card.number, user_id: @owned_card.user_id }
    end

    assert_redirected_to owned_card_path(assigns(:owned_card))
  end

  test "should show owned_card" do
    get :show, id: @owned_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @owned_card
    assert_response :success
  end

  test "should update owned_card" do
    patch :update, id: @owned_card, owned_card: { expansion_card_id: @owned_card.expansion_card_id, number: @owned_card.number, user_id: @owned_card.user_id }
    assert_redirected_to owned_card_path(assigns(:owned_card))
  end

  test "should destroy owned_card" do
    assert_difference('OwnedCard.count', -1) do
      delete :destroy, id: @owned_card
    end

    assert_redirected_to owned_cards_path
  end
end
