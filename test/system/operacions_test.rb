require "application_system_test_case"

class OperacionsTest < ApplicationSystemTestCase
  setup do
    @operacion = operacions(:one)
  end

  test "visiting the index" do
    visit operacions_url
    assert_selector "h1", text: "Operacions"
  end

  test "creating a Operacion" do
    visit operacions_url
    click_on "New Operacion"

    fill_in "Comercial", with: @operacion.venedor
    fill_in "Estado", with: @operacion.estado
    click_on "Create Operacion"

    assert_text "Operacion was successfully created"
    click_on "Back"
  end

  test "updating a Operacion" do
    visit operacions_url
    click_on "Edit", match: :first

    fill_in "Comercial", with: @operacion.venedor
    fill_in "Estado", with: @operacion.estado
    click_on "Update Operacion"

    assert_text "Operacion was successfully updated"
    click_on "Back"
  end

  test "destroying a Operacion" do
    visit operacions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Operacion was successfully destroyed"
  end
end
