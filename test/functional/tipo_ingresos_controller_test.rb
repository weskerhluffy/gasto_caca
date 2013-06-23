require 'test_helper'

class TipoIngresosControllerTest < ActionController::TestCase
  setup do
    @tipo_ingreso = tipo_ingresos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_ingresos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_ingreso" do
    assert_difference('TipoIngreso.count') do
      post :create, tipo_ingreso: { descripcion: @tipo_ingreso.descripcion }
    end

    assert_redirected_to tipo_ingreso_path(assigns(:tipo_ingreso))
  end

  test "should show tipo_ingreso" do
    get :show, id: @tipo_ingreso
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_ingreso
    assert_response :success
  end

  test "should update tipo_ingreso" do
    put :update, id: @tipo_ingreso, tipo_ingreso: { descripcion: @tipo_ingreso.descripcion }
    assert_redirected_to tipo_ingreso_path(assigns(:tipo_ingreso))
  end

  test "should destroy tipo_ingreso" do
    assert_difference('TipoIngreso.count', -1) do
      delete :destroy, id: @tipo_ingreso
    end

    assert_redirected_to tipo_ingresos_path
  end
end
