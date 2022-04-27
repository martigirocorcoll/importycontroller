require "application_system_test_case"

class FlujosTest < ApplicationSystemTestCase
  setup do
    @flujo = flujos(:one)
  end

  test "visiting the index" do
    visit flujos_url
    assert_selector "h1", text: "Flujos"
  end

  test "creating a Flujo" do
    visit flujos_url
    click_on "New Flujo"

    fill_in "Cantidad", with: @flujo.cantidad
    fill_in "Fecha efectiva", with: @flujo.fecha_efectiva
    fill_in "Fecha teorica", with: @flujo.fecha_teorica
    fill_in "Prestamo", with: @flujo.prestamo_id
    click_on "Create Flujo"

    assert_text "Flujo was successfully created"
    click_on "Back"
  end

  test "updating a Flujo" do
    visit flujos_url
    click_on "Edit", match: :first

    fill_in "Cantidad", with: @flujo.cantidad
    fill_in "Fecha efectiva", with: @flujo.fecha_efectiva
    fill_in "Fecha teorica", with: @flujo.fecha_teorica
    fill_in "Prestamo", with: @flujo.prestamo_id
    click_on "Update Flujo"

    assert_text "Flujo was successfully updated"
    click_on "Back"
  end

  test "destroying a Flujo" do
    visit flujos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Flujo was successfully destroyed"
  end
end
