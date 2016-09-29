require 'test_helper'

class RoomHistroiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get room_histroies_new_url
    assert_response :success
  end


end