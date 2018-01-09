require 'test_helper'

class Api::V1::MailsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_mails_create_url
    assert_response :success
  end

end
