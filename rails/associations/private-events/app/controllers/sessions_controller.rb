class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_name(params[:session][:name])
    if @user
      session[:id] = @user.id
      session[:name] = @user.name
      flash[:success] = "You have been succesfully signed in as #{@user.name}"
      redirect_to @user
    else
      flash[:warning] = "There is no such user"
      render 'new'
    end
  end

  def destroy
    session.delete(:name)
    session.delete(:id)
    @current_user = nil
    flash[:success] = "You have been signed out succesfully"
    redirect_to root_url
  end
end
