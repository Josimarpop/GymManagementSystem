require 'test_helper'

class Api::V1::UserGroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_user_groups_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_user_groups_show_url
    assert_response :success
  end

end
