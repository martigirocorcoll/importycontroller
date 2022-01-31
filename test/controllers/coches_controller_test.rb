require 'test_helper'

class CochesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coch = coches(:one)
  end

  test "should get index" do
    get coches_url
    assert_response :success
  end

  test "should get new" do
    get new_coch_url
    assert_response :success
  end

  test "should create coch" do
    assert_difference('Coche.count') do
      post coches_url, params: { coch: { chasis: @coch.chasis, kilometraje: @coch.kilometraje, marca: @coch.marca, modelo: @coch.modelo, primeramat: @coch.primeramat } }
    end

    assert_redirected_to coch_url(Coche.last)
  end

  test "should show coch" do
    get coch_url(@coch)
    assert_response :success
  end

  test "should get edit" do
    get edit_coch_url(@coch)
    assert_response :success
  end

  test "should update coch" do
    patch coch_url(@coch), params: { coch: { chasis: @coch.chasis, kilometraje: @coch.kilometraje, marca: @coch.marca, modelo: @coch.modelo, primeramat: @coch.primeramat } }
    assert_redirected_to coch_url(@coch)
  end

  test "should destroy coch" do
    assert_difference('Coche.count', -1) do
      delete coch_url(@coch)
    end

    assert_redirected_to coches_url
  end
end
