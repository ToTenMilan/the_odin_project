module SessionsHelper

  def current_user?
    !session[:name].nil?
  end

  def current_user
    if (user_id = session[:id])
      @current_user ||= User.find(user_id)
    end
  end

end
