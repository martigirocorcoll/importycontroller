require "application_system_test_case"

class VentaTest < ApplicationSystemTestCase
  setup do
    @ventum = venta(:one)
  end

  test "visiting the index" do
    visit venta_url
    assert_selector "h1", text: "Venta"
  end

  test "creating a Ventum" do
    visit venta_url
    click_on "New Ventum"

    fill_in "Car", with: @ventum.car_id
    check "Coche cambio" if @ventum.coche_cambio
    fill_in "Coche cambio iva", with: @ventum.coche_cambio_iva
    fill_in "Coche cambio precio", with: @ventum.coche_cambio_precio
    fill_in "Fecha", with: @ventum.fecha
    fill_in "Iva", with: @ventum.iva
    fill_in "Numero", with: @ventum.numero
    fill_in "Operacion", with: @ventum.operacion_id
    fill_in "Persona", with: @ventum.persona_id
    fill_in "Precio", with: @ventum.precio
    click_on "Create Ventum"

    assert_text "Ventum was successfully created"
    click_on "Back"
  end

  test "updating a Ventum" do
    visit venta_url
    click_on "Edit", match: :first

    fill_in "Car", with: @ventum.car_id
    check "Coche cambio" if @ventum.coche_cambio
    fill_in "Coche cambio iva", with: @ventum.coche_cambio_iva
    fill_in "Coche cambio precio", with: @ventum.coche_cambio_precio
    fill_in "Fecha", with: @ventum.fecha
    fill_in "Iva", with: @ventum.iva
    fill_in "Numero", with: @ventum.numero
    fill_in "Operacion", with: @ventum.operacion_id
    fill_in "Persona", with: @ventum.persona_id
    fill_in "Precio", with: @ventum.precio
    click_on "Update Ventum"

    assert_text "Ventum was successfully updated"
    click_on "Back"
  end

  test "destroying a Ventum" do
    visit venta_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ventum was successfully destroyed"
  end
end
