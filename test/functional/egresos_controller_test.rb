require 'test_helper'

class EgresosControllerTest < ActionController::TestCase
  setup do
    @egreso = egresos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:egresos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create egreso" do
    assert_difference('Egreso.count') do
      post :create, egreso: { aplicacion: @egreso.aplicacion, descripcion: @egreso.descripcion, monto: @egreso.monto }
    end

    assert_redirected_to egreso_path(assigns(:egreso))
  end

  test "should show egreso" do
    get :show, id: @egreso
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @egreso
    assert_response :success
  end

  test "should update egreso" do
    put :update, id: @egreso, egreso: { aplicacion: @egreso.aplicacion, descripcion: @egreso.descripcion, monto: @egreso.monto }
    assert_redirected_to egreso_path(assigns(:egreso))
  end

  test "should destroy egreso" do
    assert_difference('Egreso.count', -1) do
      delete :destroy, id: @egreso
    end

    assert_redirected_to egresos_path
  end
end
