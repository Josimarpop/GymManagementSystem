require 'test_helper'

class Api::V1::GroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_groups_create_url
    assert_response :success
  end

  test "should get index" do
    get api_v1_groups_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_groups_show_url
    assert_response :success
  end

  test "should get edit" do
    get api_v1_groups_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_groups_destroy_url
    assert_response :success
  end

end
