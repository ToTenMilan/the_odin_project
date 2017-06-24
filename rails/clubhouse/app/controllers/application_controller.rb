class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  # @test = "I shoul be available in views"

end
