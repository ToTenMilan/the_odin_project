class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)

      flash[:success] = "You have been logged in"
      # session[:user_id] = @user.id
      session[:session_test] = "This is a test session"
      cookies[:cookie_test] = "This is a test cookie"
      redirect_to root_url
      # BUG @current_user is getting nil here thereby not showing in view
    else
      flash.now[:danger] = 'incorrect email or password'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
