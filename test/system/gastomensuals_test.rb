require "application_system_test_case"

class GastomensualsTest < ApplicationSystemTestCase
  setup do
    @gastomensual = gastomensuals(:one)
  end

  test "visiting the index" do
    visit gastomensuals_url
    assert_selector "h1", text: "Gastomensuals"
  end

  test "creating a Gastomensual" do
    visit gastomensuals_url
    click_on "New Gastomensual"

    fill_in "Cantidad", with: @gastomensual.cantidad
    fill_in "Int", with: @gastomensual.int
    fill_in "Iva", with: @gastomensual.iva
    fill_in "Titol", with: @gastomensual.titol
    click_on "Create Gastomensual"

    assert_text "Gastomensual was successfully created"
    click_on "Back"
  end

  test "updating a Gastomensual" do
    visit gastomensuals_url
    click_on "Edit", match: :first

    fill_in "Cantidad", with: @gastomensual.cantidad
    fill_in "Int", with: @gastomensual.int
    fill_in "Iva", with: @gastomensual.iva
    fill_in "Titol", with: @gastomensual.titol
    click_on "Update Gastomensual"

    assert_text "Gastomensual was successfully updated"
    click_on "Back"
  end

  test "destroying a Gastomensual" do
    visit gastomensuals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gastomensual was successfully destroyed"
  end
end
