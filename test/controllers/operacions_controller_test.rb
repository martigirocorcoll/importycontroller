require 'test_helper'

class OperacionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @operacion = operacions(:one)
  end

  test "should get index" do
    get operacions_url
    assert_response :success
  end

  test "should get new" do
    get new_operacion_url
    assert_response :success
  end

  test "should create operacion" do
    assert_difference('Operacion.count') do
      post operacions_url, params: { operacion: { venedor: @operacion.venedor, estado: @operacion.estado } }
    end

    assert_redirected_to operacion_url(Operacion.last)
  end

  test "should show operacion" do
    get operacion_url(@operacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_operacion_url(@operacion)
    assert_response :success
  end

  test "should update operacion" do
    patch operacion_url(@operacion), params: { operacion: { venedor: @operacion.venedor, estado: @operacion.estado } }
    assert_redirected_to operacion_url(@operacion)
  end

  test "should destroy operacion" do
    assert_difference('Operacion.count', -1) do
      delete operacion_url(@operacion)
    end

    assert_redirected_to operacions_url
  end
end
