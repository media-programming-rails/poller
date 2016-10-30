require 'test_helper'

class LoginLogoutTest < ActionDispatch::IntegrationTest
  test "log in" do
    user = users(:one)
    visit login_path
    fill_in "Name", with: user.name
    fill_in "Password", with: 'secret'
    click_button "Log in"
    assert page.has_content?("Polls"), "Should have redirected to Polls page"
    assert page.has_content? "Log in"
  end
end
