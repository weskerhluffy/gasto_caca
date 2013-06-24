require 'test_helper'

class AplicacionPeriodicasControllerTest < ActionController::TestCase
  setup do
    @aplicacion_periodica = aplicacion_periodicas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aplicacion_periodicas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aplicacion_periodica" do
    assert_difference('AplicacionPeriodica.count') do
      post :create, aplicacion_periodica: { descripcion: @aplicacion_periodica.descripcion, monto: @aplicacion_periodica.monto }
    end

    assert_redirected_to aplicacion_periodica_path(assigns(:aplicacion_periodica))
  end

  test "should show aplicacion_periodica" do
    get :show, id: @aplicacion_periodica
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aplicacion_periodica
    assert_response :success
  end

  test "should update aplicacion_periodica" do
    put :update, id: @aplicacion_periodica, aplicacion_periodica: { descripcion: @aplicacion_periodica.descripcion, monto: @aplicacion_periodica.monto }
    assert_redirected_to aplicacion_periodica_path(assigns(:aplicacion_periodica))
  end

  test "should destroy aplicacion_periodica" do
    assert_difference('AplicacionPeriodica.count', -1) do
      delete :destroy, id: @aplicacion_periodica
    end

    assert_redirected_to aplicacion_periodicas_path
  end
end
