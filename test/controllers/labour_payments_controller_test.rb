require "test_helper"

class LabourPaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @labour_payment = labour_payments(:one)
  end

  test "should get index" do
    get labour_payments_url
    assert_response :success
  end

  test "should get new" do
    get new_labour_payment_url
    assert_response :success
  end

  test "should create labour_payment" do
    assert_difference('LabourPayment.count') do
      post labour_payments_url, params: { labour_payment: { amount: @labour_payment.amount, date: @labour_payment.date, labour_id: @labour_payment.labour_id, labour_type_id: @labour_payment.labour_type_id, project_id: @labour_payment.project_id } }
    end

    assert_redirected_to labour_payment_url(LabourPayment.last)
  end

  test "should show labour_payment" do
    get labour_payment_url(@labour_payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_labour_payment_url(@labour_payment)
    assert_response :success
  end

  test "should update labour_payment" do
    patch labour_payment_url(@labour_payment), params: { labour_payment: { amount: @labour_payment.amount, date: @labour_payment.date, labour_id: @labour_payment.labour_id, labour_type_id: @labour_payment.labour_type_id, project_id: @labour_payment.project_id } }
    assert_redirected_to labour_payment_url(@labour_payment)
  end

  test "should destroy labour_payment" do
    assert_difference('LabourPayment.count', -1) do
      delete labour_payment_url(@labour_payment)
    end

    assert_redirected_to labour_payments_url
  end
end
