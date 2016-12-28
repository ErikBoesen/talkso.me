require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "talksome"
  end

  test "should get root" do
    get root_url
    assert_response root_url
    assert_select "title", "#{@base_title}"
  end

  test "should get about" do
    get abt_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

end
