require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get admin_list_url
    assert_response :success
  end
end
