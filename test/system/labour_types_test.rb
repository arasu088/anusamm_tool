require "application_system_test_case"

class LabourTypesTest < ApplicationSystemTestCase
  setup do
    @labour_type = labour_types(:one)
  end

  test "visiting the index" do
    visit labour_types_url
    assert_selector "h1", text: "Labour Types"
  end

  test "creating a Labour type" do
    visit labour_types_url
    click_on "New Labour Type"

    check "Is active" if @labour_type.is_active
    fill_in "Name", with: @labour_type.name
    click_on "Create Labour type"

    assert_text "Labour type was successfully created"
    click_on "Back"
  end

  test "updating a Labour type" do
    visit labour_types_url
    click_on "Edit", match: :first

    check "Is active" if @labour_type.is_active
    fill_in "Name", with: @labour_type.name
    click_on "Update Labour type"

    assert_text "Labour type was successfully updated"
    click_on "Back"
  end

  test "destroying a Labour type" do
    visit labour_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Labour type was successfully destroyed"
  end
end
