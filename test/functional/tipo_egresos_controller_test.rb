require 'test_helper'

class TipoEgresosControllerTest < ActionController::TestCase
  setup do
    @tipo_egreso = tipo_egresos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_egresos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_egreso" do
    assert_difference('TipoEgreso.count') do
      post :create, tipo_egreso: { descripcion: @tipo_egreso.descripcion }
    end

    assert_redirected_to tipo_egreso_path(assigns(:tipo_egreso))
  end

  test "should show tipo_egreso" do
    get :show, id: @tipo_egreso
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_egreso
    assert_response :success
  end

  test "should update tipo_egreso" do
    put :update, id: @tipo_egreso, tipo_egreso: { descripcion: @tipo_egreso.descripcion }
    assert_redirected_to tipo_egreso_path(assigns(:tipo_egreso))
  end

  test "should destroy tipo_egreso" do
    assert_difference('TipoEgreso.count', -1) do
      delete :destroy, id: @tipo_egreso
    end

    assert_redirected_to tipo_egresos_path
  end
end
