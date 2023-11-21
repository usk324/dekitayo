require "test_helper"

class RewardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rewards_index_url
    assert_response :success
  end

  test "should get new" do
    get rewards_new_url
    assert_response :success
  end

  test "should get create" do
    get rewards_create_url
    assert_response :success
  end
end
