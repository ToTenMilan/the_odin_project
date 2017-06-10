require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:gregor)
    @other_user = users(:archer)
  end

  test "unsuccesful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "",
                                              email: "invalid@email",
                                              password: "foo",
                                              password_confirmation: "baz" } }
    assert_select "div.alert", "The form contains 4 errors" # exercise 10.1.2.1
  end

  test "succesfull edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    # assert_template 'users/edit'
    assert_redirected_to edit_user_url(@user)
    assert_nil session[:forwarding_url] # exercise 10.2.3.1
    name = "franco"
    email = "franco@mail.com"
    patch user_path(@user), params: { user: { name: name,
                                              email: email,
                                              password: "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to(@user)
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { name: "foo",
                                       email: "bar" } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end

end
