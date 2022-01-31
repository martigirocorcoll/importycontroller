require 'test_helper'

class VentaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ventum = venta(:one)
  end

  test "should get index" do
    get venta_url
    assert_response :success
  end

  test "should get new" do
    get new_ventum_url
    assert_response :success
  end

  test "should create ventum" do
    assert_difference('Ventum.count') do
      post venta_url, params: { ventum: { car_id: @ventum.car_id, coche_cambio: @ventum.coche_cambio, coche_cambio_iva: @ventum.coche_cambio_iva, coche_cambio_precio: @ventum.coche_cambio_precio, fecha: @ventum.fecha, iva: @ventum.iva, numero: @ventum.numero, operacion_id: @ventum.operacion_id, persona_id: @ventum.persona_id, precio: @ventum.precio } }
    end

    assert_redirected_to ventum_url(Ventum.last)
  end

  test "should show ventum" do
    get ventum_url(@ventum)
    assert_response :success
  end

  test "should get edit" do
    get edit_ventum_url(@ventum)
    assert_response :success
  end

  test "should update ventum" do
    patch ventum_url(@ventum), params: { ventum: { car_id: @ventum.car_id, coche_cambio: @ventum.coche_cambio, coche_cambio_iva: @ventum.coche_cambio_iva, coche_cambio_precio: @ventum.coche_cambio_precio, fecha: @ventum.fecha, iva: @ventum.iva, numero: @ventum.numero, operacion_id: @ventum.operacion_id, persona_id: @ventum.persona_id, precio: @ventum.precio } }
    assert_redirected_to ventum_url(@ventum)
  end

  test "should destroy ventum" do
    assert_difference('Ventum.count', -1) do
      delete ventum_url(@ventum)
    end

    assert_redirected_to venta_url
  end
end
