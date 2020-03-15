require 'test_helper'

class Tourist::SchedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tourist_schedules_index_url
    assert_response :success
  end

  test "should get show" do
    get tourist_schedules_show_url
    assert_response :success
  end

end
