require 'test_helper'

class FlujosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @flujo = flujos(:one)
  end

  test "should get index" do
    get flujos_url
    assert_response :success
  end

  test "should get new" do
    get new_flujo_url
    assert_response :success
  end

  test "should create flujo" do
    assert_difference('Flujo.count') do
      post flujos_url, params: { flujo: { cantidad: @flujo.cantidad, fecha_efectiva: @flujo.fecha_efectiva, fecha_teorica: @flujo.fecha_teorica, prestamo_id: @flujo.prestamo_id } }
    end

    assert_redirected_to flujo_url(Flujo.last)
  end

  test "should show flujo" do
    get flujo_url(@flujo)
    assert_response :success
  end

  test "should get edit" do
    get edit_flujo_url(@flujo)
    assert_response :success
  end

  test "should update flujo" do
    patch flujo_url(@flujo), params: { flujo: { cantidad: @flujo.cantidad, fecha_efectiva: @flujo.fecha_efectiva, fecha_teorica: @flujo.fecha_teorica, prestamo_id: @flujo.prestamo_id } }
    assert_redirected_to flujo_url(@flujo)
  end

  test "should destroy flujo" do
    assert_difference('Flujo.count', -1) do
      delete flujo_url(@flujo)
    end

    assert_redirected_to flujos_url
  end
end
