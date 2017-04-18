require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "Should get root" do
    get root_path
    # get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  # test "should get home" do
  #   get static_pages_home_url
  #   assert_response :success
  #   assert_select "title", "Home | #{@base_title}"
  # end

  test "should get help" do
    # get static_pages_help_url
    get help_path # help_url is possible here
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    # get static_pages_about_url
    get about_path # about_url is possible here
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    # get static_pages_contact_url
    get contact_path # cpntact_url is possible here
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end

end
