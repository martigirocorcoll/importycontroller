require 'test_helper'

class GastomensualsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gastomensual = gastomensuals(:one)
  end

  test "should get index" do
    get gastomensuals_url
    assert_response :success
  end

  test "should get new" do
    get new_gastomensual_url
    assert_response :success
  end

  test "should create gastomensual" do
    assert_difference('Gastomensual.count') do
      post gastomensuals_url, params: { gastomensual: { cantidad: @gastomensual.cantidad, int: @gastomensual.int, iva: @gastomensual.iva, titol: @gastomensual.titol } }
    end

    assert_redirected_to gastomensual_url(Gastomensual.last)
  end

  test "should show gastomensual" do
    get gastomensual_url(@gastomensual)
    assert_response :success
  end

  test "should get edit" do
    get edit_gastomensual_url(@gastomensual)
    assert_response :success
  end

  test "should update gastomensual" do
    patch gastomensual_url(@gastomensual), params: { gastomensual: { cantidad: @gastomensual.cantidad, int: @gastomensual.int, iva: @gastomensual.iva, titol: @gastomensual.titol } }
    assert_redirected_to gastomensual_url(@gastomensual)
  end

  test "should destroy gastomensual" do
    assert_difference('Gastomensual.count', -1) do
      delete gastomensual_url(@gastomensual)
    end

    assert_redirected_to gastomensuals_url
  end
end
