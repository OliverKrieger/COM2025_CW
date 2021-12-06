require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  test "should get home" do
    get root_url
    assert_response :success
  end

  test 'should redirect after login' do
    user = User.new
    user.email = 'bob@example.com'
    user.password = '12345678'
    user.save
    sign_in user
    post new_user_session_url
    assert_redirected_to root_url 
  end

end
