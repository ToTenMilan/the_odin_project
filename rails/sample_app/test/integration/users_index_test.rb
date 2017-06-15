require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:gregor)
    @non_admin = users(:archer)
  end

  test "index as admin including pagination and delete links" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination'
    first_page_of_users = User.where(activated: true).paginate(page: 1) # `where(activated: true)` added by exercise 11.3.3.3
    first_page_of_users.each do |user|
      assert_select "a[href=?]", user_path(user), text: user.name
      unless user == @admin # why not `if user.admin?`
        assert_select "a[href=?]", user_path(user), text: 'delete'
      end
    end
    assert_difference 'User.count', -1 do
      delete user_path(@non_admin)
    end
  end

  test "index as non admin" do
    log_in_as(@non_admin)
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end

  # exercise 11.3.3.3
  test "index do not list not activated users" do
    users(:lana).update_attribute(:activated, false)
    users(:malory).update_attribute(:activated, false)
    log_in_as(@non_admin)
    get users_path
    assert_template 'users/index'
    assert_select 'ul.users li', count: User.where(activated: true).size
  end

end
