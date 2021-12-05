require "application_system_test_case"

class AbstractQuantitiesTest < ApplicationSystemTestCase
  setup do
    @abstract_quantity = abstract_quantities(:one)
  end

  test "visiting the index" do
    visit abstract_quantities_url
    assert_selector "h1", text: "Abstract Quantities"
  end

  test "creating a Abstract quantity" do
    visit abstract_quantities_url
    click_on "New Abstract Quantity"

    fill_in "Amount", with: @abstract_quantity.amount
    fill_in "Material", with: @abstract_quantity.material_id
    fill_in "Project", with: @abstract_quantity.project_id
    fill_in "Quantity", with: @abstract_quantity.quantity
    fill_in "Total", with: @abstract_quantity.total
    click_on "Create Abstract quantity"

    assert_text "Abstract quantity was successfully created"
    click_on "Back"
  end

  test "updating a Abstract quantity" do
    visit abstract_quantities_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @abstract_quantity.amount
    fill_in "Material", with: @abstract_quantity.material_id
    fill_in "Project", with: @abstract_quantity.project_id
    fill_in "Quantity", with: @abstract_quantity.quantity
    fill_in "Total", with: @abstract_quantity.total
    click_on "Update Abstract quantity"

    assert_text "Abstract quantity was successfully updated"
    click_on "Back"
  end

  test "destroying a Abstract quantity" do
    visit abstract_quantities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Abstract quantity was successfully destroyed"
  end
end
