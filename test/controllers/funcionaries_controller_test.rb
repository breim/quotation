require 'test_helper'

class FuncionariesControllerTest < ActionController::TestCase
  setup do
    @funcionary = funcionaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:funcionaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create funcionary" do
    assert_difference('Funcionary.count') do
      post :create, funcionary: { company_id: @funcionary.company_id, user_id: @funcionary.user_id }
    end

    assert_redirected_to funcionary_path(assigns(:funcionary))
  end

  test "should show funcionary" do
    get :show, id: @funcionary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @funcionary
    assert_response :success
  end

  test "should update funcionary" do
    patch :update, id: @funcionary, funcionary: { company_id: @funcionary.company_id, user_id: @funcionary.user_id }
    assert_redirected_to funcionary_path(assigns(:funcionary))
  end

  test "should destroy funcionary" do
    assert_difference('Funcionary.count', -1) do
      delete :destroy, id: @funcionary
    end

    assert_redirected_to funcionaries_path
  end
end
