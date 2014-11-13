require 'test_helper'

class ItensControllerTest < ActionController::TestCase
  setup do
    @iten = itens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:itens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create iten" do
    assert_difference('Iten.count') do
      post :create, iten: { amount: @iten.amount, name: @iten.name, part_number: @iten.part_number, quote_id: @iten.quote_id }
    end

    assert_redirected_to iten_path(assigns(:iten))
  end

  test "should show iten" do
    get :show, id: @iten
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @iten
    assert_response :success
  end

  test "should update iten" do
    patch :update, id: @iten, iten: { amount: @iten.amount, name: @iten.name, part_number: @iten.part_number, quote_id: @iten.quote_id }
    assert_redirected_to iten_path(assigns(:iten))
  end

  test "should destroy iten" do
    assert_difference('Iten.count', -1) do
      delete :destroy, id: @iten
    end

    assert_redirected_to itens_path
  end
end
