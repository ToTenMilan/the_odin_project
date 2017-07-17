class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  # confirms a logged in user
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "You need to login to perform this action"
        redirect_to login_url
      end
    end
end
