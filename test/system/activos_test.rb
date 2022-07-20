require "application_system_test_case"

class ActivosTest < ApplicationSystemTestCase
  setup do
    @activo = activos(:one)
  end

  test "visiting the index" do
    visit activos_url
    assert_selector "h1", text: "Activos"
  end

  test "creating a Activo" do
    visit activos_url
    click_on "New Activo"

    fill_in "Cantidad", with: @activo.cantidad
    fill_in "Descripcion", with: @activo.descripcion
    fill_in "Tipo", with: @activo.tipo
    fill_in "Titular", with: @activo.titular
    click_on "Create Activo"

    assert_text "Activo was successfully created"
    click_on "Back"
  end

  test "updating a Activo" do
    visit activos_url
    click_on "Edit", match: :first

    fill_in "Cantidad", with: @activo.cantidad
    fill_in "Descripcion", with: @activo.descripcion
    fill_in "Tipo", with: @activo.tipo
    fill_in "Titular", with: @activo.titular
    click_on "Update Activo"

    assert_text "Activo was successfully updated"
    click_on "Back"
  end

  test "destroying a Activo" do
    visit activos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Activo was successfully destroyed"
  end
end
