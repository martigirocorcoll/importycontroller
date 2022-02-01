require "application_system_test_case"

class SalesTest < ApplicationSystemTestCase
  setup do
    @sale = sales(:one)
  end

  test "visiting the index" do
    visit sales_url
    assert_selector "h1", text: "Sales"
  end

  test "creating a Sale" do
    visit sales_url
    click_on "New Sale"

    fill_in "Car", with: @sale.car_id
    check "Coche cambio" if @sale.coche_cambio
    fill_in "Coche cambio iva", with: @sale.coche_cambio_iva
    fill_in "Coche cambio precio", with: @sale.coche_cambio_precio
    fill_in "Fecha", with: @sale.fecha
    fill_in "Iva", with: @sale.iva
    fill_in "Numero", with: @sale.numero
    fill_in "Operacion", with: @sale.operacion_id
    fill_in "Persona", with: @sale.persona_id
    fill_in "Precio", with: @sale.precio
    click_on "Create Sale"

    assert_text "Sale was successfully created"
    click_on "Back"
  end

  test "updating a Sale" do
    visit sales_url
    click_on "Edit", match: :first

    fill_in "Car", with: @sale.car_id
    check "Coche cambio" if @sale.coche_cambio
    fill_in "Coche cambio iva", with: @sale.coche_cambio_iva
    fill_in "Coche cambio precio", with: @sale.coche_cambio_precio
    fill_in "Fecha", with: @sale.fecha
    fill_in "Iva", with: @sale.iva
    fill_in "Numero", with: @sale.numero
    fill_in "Operacion", with: @sale.operacion_id
    fill_in "Persona", with: @sale.persona_id
    fill_in "Precio", with: @sale.precio
    click_on "Update Sale"

    assert_text "Sale was successfully updated"
    click_on "Back"
  end

  test "destroying a Sale" do
    visit sales_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sale was successfully destroyed"
  end
end
