class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)

      flash[:success] = "You have been logged in"
      redirect_to root_url
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
