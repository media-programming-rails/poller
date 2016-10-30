require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @user_params = { name:    @user.name,  password: 'secret' }
    @user_params_with_wrong_password = { name:    @user.name,  password: 'password' }
  end

  test "login with valid information" do
    get login_path
    post login_path, params: { session: @user_params}
    assert_redirected_to root_path
    assert is_logged_in?, "must be logged in now"
  end

  test "login with wrong password" do
    get login_path
    post login_path, params: { session: @user_params_with_wrong_password}
    assert_redirected_to login_path
    assert !is_logged_in?, "must not be logged in now"

  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: @user_params }
    assert is_logged_in?, "must be logged in now"
    assert_redirected_to root_path

    delete logout_path
    assert_not is_logged_in?, "must be logged out now"
    assert_redirected_to root_path

  end


  test "links when logged in" do
    post login_path, params: { session: @user_params}
    assert is_logged_in?, "must be logged in now"
    assert_redirected_to root_path
    follow_redirect!
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
  end
  test "links when not logged in" do
    get root_path
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end
  test "links when logged out" do
    post login_path, params: { session: @user_params}
    assert is_logged_in?, "must be logged in now"
    delete logout_path
    assert_redirected_to root_path
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end
end
