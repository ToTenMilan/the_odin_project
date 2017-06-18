class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  attr_writer :current_user
  include SessionsHelper

  # @test = "I shoul be available in views"

end
