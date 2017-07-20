class UsersController < ApplicationController

  def new
    # (note to me in future) refactor to use helper method
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
    # cookies[:name] = @user.name
    # cookies[:id] = @user.id
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
    @created_events = @user.created_events
    @upcoming_events = current_user.upcoming_events
    @previous_events = current_user.previous_events
  end

  def destroy
    session.delete(:id)
    @current_user = nil
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end

end
