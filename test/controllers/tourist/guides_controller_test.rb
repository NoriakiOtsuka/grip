require 'test_helper'

class Tourist::GuidesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tourist_guides_index_url
    assert_response :success
  end

  test "should get show" do
    get tourist_guides_show_url
    assert_response :success
  end

  test "should get new" do
    get tourist_guides_new_url
    assert_response :success
  end

end
