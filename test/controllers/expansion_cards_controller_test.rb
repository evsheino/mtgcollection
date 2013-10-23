require 'test_helper'

class ExpansionCardsControllerTest < ActionController::TestCase
  setup do
    @printing = expansion_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:printings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create printing" do
    assert_difference('Printing.count') do
      post :create, printing: { card_id: @printing.card_id, expansion_id: @printing.expansion_id }
    end

    assert_redirected_to expansion_card_path(assigns(:printing))
  end

  test "should show printing" do
    get :show, id: @printing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @printing
    assert_response :success
  end

  test "should update printing" do
    patch :update, id: @printing, printing: { card_id: @printing.card_id, expansion_id: @printing.expansion_id }
    assert_redirected_to expansion_card_path(assigns(:printing))
  end

  test "should destroy printing" do
    assert_difference('Printing.count', -1) do
      delete :destroy, id: @printing
    end

    assert_redirected_to expansion_cards_path
  end
end
