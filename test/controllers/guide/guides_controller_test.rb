require 'test_helper'

class Guide::GuidesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get guide_guides_index_url
    assert_response :success
  end

  test "should get show" do
    get guide_guides_show_url
    assert_response :success
  end

  test "should get create" do
    get guide_guides_create_url
    assert_response :success
  end

end
