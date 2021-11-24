require "application_system_test_case"

class MaterialExpensesTest < ApplicationSystemTestCase
  setup do
    @material_expense = material_expenses(:one)
  end

  test "visiting the index" do
    visit material_expenses_url
    assert_selector "h1", text: "Material Expenses"
  end

  test "creating a Material expense" do
    visit material_expenses_url
    click_on "New Material Expense"

    fill_in "Amount", with: @material_expense.amount
    fill_in "Date", with: @material_expense.date
    fill_in "Gst", with: @material_expense.gst
    fill_in "Material", with: @material_expense.material_id
    fill_in "Project", with: @material_expense.project_id
    fill_in "Quantity", with: @material_expense.quantity
    fill_in "Supplier", with: @material_expense.supplier_id
    fill_in "Total amount", with: @material_expense.total_amount
    click_on "Create Material expense"

    assert_text "Material expense was successfully created"
    click_on "Back"
  end

  test "updating a Material expense" do
    visit material_expenses_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @material_expense.amount
    fill_in "Date", with: @material_expense.date
    fill_in "Gst", with: @material_expense.gst
    fill_in "Material", with: @material_expense.material_id
    fill_in "Project", with: @material_expense.project_id
    fill_in "Quantity", with: @material_expense.quantity
    fill_in "Supplier", with: @material_expense.supplier_id
    fill_in "Total amount", with: @material_expense.total_amount
    click_on "Update Material expense"

    assert_text "Material expense was successfully updated"
    click_on "Back"
  end

  test "destroying a Material expense" do
    visit material_expenses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Material expense was successfully destroyed"
  end
end
