require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

    def setup
        @user = users(:michael)
    end

    test "login with invalid information" do
        get li_path
        assert_template 'sessions/new'
        post li_path, params: { session: { email: "", password: "" } }
        assert_template 'sessions/new'
        assert_not flash.empty?
        get root_path
        assert flash.empty?
    end

    test "login with valid information followed by logout" do
        get li_path
        post li_path, params: { session: { email:    @user.email,
                                             password: 'password' } }
        assert is_logged_in?
        assert_redirected_to @user
        follow_redirect!
        assert_template 'users/show'
        assert_select "a[href=?]", li_path, count: 0
        assert_select "a[href=?]", lo_path
        assert_select "a[href=?]", user_path(@user)
        delete lo_path
        assert_not is_logged_in?
        assert_redirected_to root_url
        follow_redirect!
        assert_select "a[href=?]", li_path
        assert_select "a[href=?]", lo_path,      count: 0
        assert_select "a[href=?]", user_path(@user), count: 0
    end
end