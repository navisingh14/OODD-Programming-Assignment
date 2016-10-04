require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signup_path    assert_response :success
  end
  
  def setup
    @member = members(:Andy)
    @other_member = members(:James)
  end
  
  test "should redirect index when not logged in" do
    get members_path
    assert_redirected_to login_url
  end
  
  test "should redirect update when not logged in" do
    patch member_path(@user), params: { member: { name: @member.name,
                                              email: @member.email }}
    assert_not flash.empty?
    assert_redirected_to login_url
  end
 
      
  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(other_member)
    assert_no_different 'Member.count' do
      delete member_path(@member)
    end
    assert_redirected_to root_url
  end
end




