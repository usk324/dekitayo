require "test_helper"

class ClaimedRewardsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get claimed_rewards_create_url
    assert_response :success
  end
end
