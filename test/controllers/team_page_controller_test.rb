require "test_helper"

class TeamPageControllerTest < ActionDispatch::IntegrationTest
  test "should get each" do
    get team_page_each_url
    assert_response :success
  end
end
