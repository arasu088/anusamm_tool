require "application_system_test_case"

class LaboursTest < ApplicationSystemTestCase
  setup do
    @labour = labours(:one)
  end

  test "visiting the index" do
    visit labours_url
    assert_selector "h1", text: "Labours"
  end

  test "creating a Labour" do
    visit labours_url
    click_on "New Labour"

    check "Is active" if @labour.is_active
    fill_in "Labour type", with: @labour.labour_type_id
    fill_in "Name", with: @labour.name
    fill_in "Number", with: @labour.number
    click_on "Create Labour"

    assert_text "Labour was successfully created"
    click_on "Back"
  end

  test "updating a Labour" do
    visit labours_url
    click_on "Edit", match: :first

    check "Is active" if @labour.is_active
    fill_in "Labour type", with: @labour.labour_type_id
    fill_in "Name", with: @labour.name
    fill_in "Number", with: @labour.number
    click_on "Update Labour"

    assert_text "Labour was successfully updated"
    click_on "Back"
  end

  test "destroying a Labour" do
    visit labours_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Labour was successfully destroyed"
  end
end
