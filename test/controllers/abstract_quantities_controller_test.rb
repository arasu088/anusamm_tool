require "test_helper"

class AbstractQuantitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @abstract_quantity = abstract_quantities(:one)
  end

  test "should get index" do
    get abstract_quantities_url
    assert_response :success
  end

  test "should get new" do
    get new_abstract_quantity_url
    assert_response :success
  end

  test "should create abstract_quantity" do
    assert_difference('AbstractQuantity.count') do
      post abstract_quantities_url, params: { abstract_quantity: { amount: @abstract_quantity.amount, material_id: @abstract_quantity.material_id, project_id: @abstract_quantity.project_id, quantity: @abstract_quantity.quantity, total: @abstract_quantity.total } }
    end

    assert_redirected_to abstract_quantity_url(AbstractQuantity.last)
  end

  test "should show abstract_quantity" do
    get abstract_quantity_url(@abstract_quantity)
    assert_response :success
  end

  test "should get edit" do
    get edit_abstract_quantity_url(@abstract_quantity)
    assert_response :success
  end

  test "should update abstract_quantity" do
    patch abstract_quantity_url(@abstract_quantity), params: { abstract_quantity: { amount: @abstract_quantity.amount, material_id: @abstract_quantity.material_id, project_id: @abstract_quantity.project_id, quantity: @abstract_quantity.quantity, total: @abstract_quantity.total } }
    assert_redirected_to abstract_quantity_url(@abstract_quantity)
  end

  test "should destroy abstract_quantity" do
    assert_difference('AbstractQuantity.count', -1) do
      delete abstract_quantity_url(@abstract_quantity)
    end

    assert_redirected_to abstract_quantities_url
  end
end
