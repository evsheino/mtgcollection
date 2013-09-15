require 'test_helper'

class ExpansionsControllerTest < ActionController::TestCase
  setup do
    @expansion = expansions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expansions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expansion" do
    assert_difference('Expansion.count') do
      post :create, expansion: { name: @expansion.name }
    end

    assert_redirected_to expansion_path(assigns(:expansion))
  end

  test "should show expansion" do
    get :show, id: @expansion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expansion
    assert_response :success
  end

  test "should update expansion" do
    patch :update, id: @expansion, expansion: { name: @expansion.name }
    assert_redirected_to expansion_path(assigns(:expansion))
  end

  test "should destroy expansion" do
    assert_difference('Expansion.count', -1) do
      delete :destroy, id: @expansion
    end

    assert_redirected_to expansions_path
  end
end
