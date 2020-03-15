require 'test_helper'

class Guide::SchedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get guide_schedules_index_url
    assert_response :success
  end

  test "should get show" do
    get guide_schedules_show_url
    assert_response :success
  end

end
