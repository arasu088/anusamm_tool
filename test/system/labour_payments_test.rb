require "application_system_test_case"

class LabourPaymentsTest < ApplicationSystemTestCase
  setup do
    @labour_payment = labour_payments(:one)
  end

  test "visiting the index" do
    visit labour_payments_url
    assert_selector "h1", text: "Labour Payments"
  end

  test "creating a Labour payment" do
    visit labour_payments_url
    click_on "New Labour Payment"

    fill_in "Amount", with: @labour_payment.amount
    fill_in "Date", with: @labour_payment.date
    fill_in "Labour", with: @labour_payment.labour_id
    fill_in "Labour type", with: @labour_payment.labour_type_id
    fill_in "Project", with: @labour_payment.project_id
    click_on "Create Labour payment"

    assert_text "Labour payment was successfully created"
    click_on "Back"
  end

  test "updating a Labour payment" do
    visit labour_payments_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @labour_payment.amount
    fill_in "Date", with: @labour_payment.date
    fill_in "Labour", with: @labour_payment.labour_id
    fill_in "Labour type", with: @labour_payment.labour_type_id
    fill_in "Project", with: @labour_payment.project_id
    click_on "Update Labour payment"

    assert_text "Labour payment was successfully updated"
    click_on "Back"
  end

  test "destroying a Labour payment" do
    visit labour_payments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Labour payment was successfully destroyed"
  end
end
