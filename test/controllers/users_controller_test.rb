require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user       = users(:michael)
    @other_user = users(:joe)
  end

  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to li_url
  end

  test "should get new user" do
    get users_new_url
    assert_response :success
  end
end
