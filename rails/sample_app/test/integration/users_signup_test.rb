require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "Invalid signup information" do
    get signup_path
    assert_select('form[action="/signup"]')
    assert_no_difference 'User.count' do
      post users_path, params: {user: {name: "",
                                  email: "user@invalid",
                                  password: "foo",
                                  password_confirmation: "bar"} }
    end
    assert_template 'users/new'
    # assert_select('div#error_explanation')
    # assert_select('div.alert')
  end

  test "valid signup information" do
    get signup_path
    assert_select('form[action="/signup"]')
    assert_difference 'User.count', 1 do
      post users_path, params: {user: {name: "foo",
                                  email: "foo@bar.com",
                                  password: "foobar",
                                  password_confirmation: "foobar"}}
    end
    follow_redirect!
    assert_template 'users/show'
    # assert_select('div.alert-success')
    assert is_logged_in?
    assert_not flash.empty?
  end
end
