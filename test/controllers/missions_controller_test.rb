require "test_helper"

class MissionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get missions_new_url
    assert_response :success
  end

  test "should get create" do
    get missions_create_url
    assert_response :success
  end

  test "should get show" do
    get missions_show_url
    assert_response :success
  end

  test "should get update" do
    get missions_update_url
    assert_response :success
  end

  test "should get board" do
    get missions_board_url
    assert_response :success
  end
end
