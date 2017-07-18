class UsersController < ApplicationController

  def new
    if session[:user_name].nil?
      @user = User.new
    else
      @user = User.find(session[:id])
      flash[:info] = "You are already signed in"
      redirect_to @user
    end
  end

  def create
    @user = User.new(user_params)
    @user.save
    session[:user_name] = @user.name
    session[:id] = @user.id
    cookies[:name] = @user.name
    cookies[:id] = @user.id
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end

end
