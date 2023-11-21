require "test_helper"

class Manage::ChildrenControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get manage_children_new_url
    assert_response :success
  end

  test "should get create" do
    get manage_children_create_url
    assert_response :success
  end

  test "should get show" do
    get manage_children_show_url
    assert_response :success
  end

  test "should get index" do
    get manage_children_index_url
    assert_response :success
  end
end
