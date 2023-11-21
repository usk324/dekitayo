require "test_helper"

class Manage::MissionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get manage_missions_new_url
    assert_response :success
  end

  test "should get create" do
    get manage_missions_create_url
    assert_response :success
  end
end
