require "test_helper"

class Manage::RewardsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get manage_rewards_new_url
    assert_response :success
  end

  test "should get create" do
    get manage_rewards_create_url
    assert_response :success
  end
end
