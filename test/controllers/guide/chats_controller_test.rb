require 'test_helper'

class Guide::ChatsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get guide_chats_create_url
    assert_response :success
  end

end
