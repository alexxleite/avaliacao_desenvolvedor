require 'test_helper'

class ReceitaControllerTest < ActionController::TestCase
  setup do
    @receitum = receita(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receita)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receitum" do
    assert_difference('Receitum.count') do
      post :create, receitum: { receita_acumulada: @receitum.receita_acumulada, receita_venda: @receitum.receita_venda, venda_id: @receitum.venda_id }
    end

    assert_redirected_to receitum_path(assigns(:receitum))
  end

  test "should show receitum" do
    get :show, id: @receitum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @receitum
    assert_response :success
  end

  test "should update receitum" do
    patch :update, id: @receitum, receitum: { receita_acumulada: @receitum.receita_acumulada, receita_venda: @receitum.receita_venda, venda_id: @receitum.venda_id }
    assert_redirected_to receitum_path(assigns(:receitum))
  end

  test "should destroy receitum" do
    assert_difference('Receitum.count', -1) do
      delete :destroy, id: @receitum
    end

    assert_redirected_to receita_path
  end
end
