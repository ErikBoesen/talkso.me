require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Talksome"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | Talksome"
  end

  test "should get about" do
    get abt_path
    assert_response :success
    assert_select "title", "About | Talksome"
  end

  test "should get contact" do
    get c_path
    assert_response :success
    assert_select "title", "Contact | Talksome"
  end
end
