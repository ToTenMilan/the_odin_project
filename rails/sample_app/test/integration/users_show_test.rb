require 'test_helper'

# exercise 11.3.3.3
class UsersShowTest < ActionDispatch::IntegrationTest

  def setup
    @non_admin = users(:archer)
    @lana = users(:lana)
  end

  test "redirect to home if show not activated user" do
    @lana.update_attribute(:activated, false)
    log_in_as(@non_admin)
    get user_path(@lana)
    assert_redirected_to root_url
  end

end
