require "test_helper"

class MaterialExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @material_expense = material_expenses(:one)
  end

  test "should get index" do
    get material_expenses_url
    assert_response :success
  end

  test "should get new" do
    get new_material_expense_url
    assert_response :success
  end

  test "should create material_expense" do
    assert_difference('MaterialExpense.count') do
      post material_expenses_url, params: { material_expense: { amount: @material_expense.amount, date: @material_expense.date, gst: @material_expense.gst, material_id: @material_expense.material_id, project_id: @material_expense.project_id, quantity: @material_expense.quantity, supplier_id: @material_expense.supplier_id, total_amount: @material_expense.total_amount } }
    end

    assert_redirected_to material_expense_url(MaterialExpense.last)
  end

  test "should show material_expense" do
    get material_expense_url(@material_expense)
    assert_response :success
  end

  test "should get edit" do
    get edit_material_expense_url(@material_expense)
    assert_response :success
  end

  test "should update material_expense" do
    patch material_expense_url(@material_expense), params: { material_expense: { amount: @material_expense.amount, date: @material_expense.date, gst: @material_expense.gst, material_id: @material_expense.material_id, project_id: @material_expense.project_id, quantity: @material_expense.quantity, supplier_id: @material_expense.supplier_id, total_amount: @material_expense.total_amount } }
    assert_redirected_to material_expense_url(@material_expense)
  end

  test "should destroy material_expense" do
    assert_difference('MaterialExpense.count', -1) do
      delete material_expense_url(@material_expense)
    end

    assert_redirected_to material_expenses_url
  end
end
