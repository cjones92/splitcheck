require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    sign_in users(:one)
    @user = users(:one)
    
  end
  
  test "should show user summary page when logged in" do
    get user_url(@user)
    assert_response :success
  end
  
  test "should not show user summary page when not logged in" do
     sign_out @user
     get user_url(@user)
     assert_redirected_to new_user_session_path
  end
end
