require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  # exercise 10.3.1.1
  def setup
    @user = users(:gregor)
  end

  test "layout links for logged in user" do
    log_in_as(@user)
    get root_path
    assert_template 'static_pages/home'

    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", edit_user_path(@user)
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", about_path

    assert_select "a[href=?]", contact_path
    get contact_path
    assert_select "title", full_title("Contact")
  end

  test "layout links for logged out user" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", about_path

    assert_select "a[href=?]", signup_path
    get signup_path
    assert_select "title", full_title("Sign up")

    assert_select "a[href=?]", contact_path
    get contact_path
    assert_select "title", full_title("Contact")
  end
end
