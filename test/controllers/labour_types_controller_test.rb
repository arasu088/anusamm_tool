require "test_helper"

class LabourTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @labour_type = labour_types(:one)
  end

  test "should get index" do
    get labour_types_url
    assert_response :success
  end

  test "should get new" do
    get new_labour_type_url
    assert_response :success
  end

  test "should create labour_type" do
    assert_difference('LabourType.count') do
      post labour_types_url, params: { labour_type: { is_active: @labour_type.is_active, name: @labour_type.name } }
    end

    assert_redirected_to labour_type_url(LabourType.last)
  end

  test "should show labour_type" do
    get labour_type_url(@labour_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_labour_type_url(@labour_type)
    assert_response :success
  end

  test "should update labour_type" do
    patch labour_type_url(@labour_type), params: { labour_type: { is_active: @labour_type.is_active, name: @labour_type.name } }
    assert_redirected_to labour_type_url(@labour_type)
  end

  test "should destroy labour_type" do
    assert_difference('LabourType.count', -1) do
      delete labour_type_url(@labour_type)
    end

    assert_redirected_to labour_types_url
  end
end
