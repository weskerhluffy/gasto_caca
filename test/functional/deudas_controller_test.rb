require 'test_helper'

class DeudasControllerTest < ActionController::TestCase
  setup do
    @deuda = deudas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deudas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deuda" do
    assert_difference('Deuda.count') do
      post :create, deuda: { contraido: @deuda.contraido, descripcion: @deuda.descripcion, monto: @deuda.monto }
    end

    assert_redirected_to deuda_path(assigns(:deuda))
  end

  test "should show deuda" do
    get :show, id: @deuda
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deuda
    assert_response :success
  end

  test "should update deuda" do
    put :update, id: @deuda, deuda: { contraido: @deuda.contraido, descripcion: @deuda.descripcion, monto: @deuda.monto }
    assert_redirected_to deuda_path(assigns(:deuda))
  end

  test "should destroy deuda" do
    assert_difference('Deuda.count', -1) do
      delete :destroy, id: @deuda
    end

    assert_redirected_to deudas_path
  end
end
