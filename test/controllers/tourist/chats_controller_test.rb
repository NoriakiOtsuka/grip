require 'test_helper'

class Tourist::ChatsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get tourist_chats_create_url
    assert_response :success
  end

end
