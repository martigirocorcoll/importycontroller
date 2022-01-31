require "application_system_test_case"

class PersonasTest < ApplicationSystemTestCase
  setup do
    @persona = personas(:one)
  end

  test "visiting the index" do
    visit personas_url
    assert_selector "h1", text: "Personas"
  end

  test "creating a Persona" do
    visit personas_url
    click_on "New Persona"

    fill_in "Apellido", with: @persona.apellido
    fill_in "Cif", with: @persona.cif
    fill_in "Ciudad", with: @persona.ciudad
    fill_in "Cp", with: @persona.cp
    fill_in "Direccion", with: @persona.direccion
    fill_in "Mail", with: @persona.mail
    fill_in "Nombre", with: @persona.nombre
    fill_in "Pais", with: @persona.pais
    fill_in "Telefono", with: @persona.telefono
    click_on "Create Persona"

    assert_text "Persona was successfully created"
    click_on "Back"
  end

  test "updating a Persona" do
    visit personas_url
    click_on "Edit", match: :first

    fill_in "Apellido", with: @persona.apellido
    fill_in "Cif", with: @persona.cif
    fill_in "Ciudad", with: @persona.ciudad
    fill_in "Cp", with: @persona.cp
    fill_in "Direccion", with: @persona.direccion
    fill_in "Mail", with: @persona.mail
    fill_in "Nombre", with: @persona.nombre
    fill_in "Pais", with: @persona.pais
    fill_in "Telefono", with: @persona.telefono
    click_on "Update Persona"

    assert_text "Persona was successfully updated"
    click_on "Back"
  end

  test "destroying a Persona" do
    visit personas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Persona was successfully destroyed"
  end
end
