require "test_helper"

class EscalationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get escalation_index_url
    assert_response :success
  end
end
