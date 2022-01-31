require "application_system_test_case"

class CochesTest < ApplicationSystemTestCase
  setup do
    @coch = coches(:one)
  end

  test "visiting the index" do
    visit coches_url
    assert_selector "h1", text: "Coches"
  end

  test "creating a Coche" do
    visit coches_url
    click_on "New Coche"

    fill_in "Chasis", with: @coch.chasis
    fill_in "Kilometraje", with: @coch.kilometraje
    fill_in "Marca", with: @coch.marca
    fill_in "Modelo", with: @coch.modelo
    fill_in "Primeramat", with: @coch.primeramat
    click_on "Create Coche"

    assert_text "Coche was successfully created"
    click_on "Back"
  end

  test "updating a Coche" do
    visit coches_url
    click_on "Edit", match: :first

    fill_in "Chasis", with: @coch.chasis
    fill_in "Kilometraje", with: @coch.kilometraje
    fill_in "Marca", with: @coch.marca
    fill_in "Modelo", with: @coch.modelo
    fill_in "Primeramat", with: @coch.primeramat
    click_on "Update Coche"

    assert_text "Coche was successfully updated"
    click_on "Back"
  end

  test "destroying a Coche" do
    visit coches_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Coche was successfully destroyed"
  end
end
