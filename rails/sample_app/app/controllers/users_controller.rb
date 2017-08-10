class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.where(activated: true).paginate(page: params[:page], per_page: 30)  # exercise 11.3.3.2
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    redirect_to root_url and return unless @user.activated? # exercise 11.3.3.2
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email # code moved to User model
      flash[:success] = "Please check your email to activate your account"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    # @user = User.find(params[:id]) # turned off by correct_user method
  end

  def update
    # @user = User.find(params[:id]) # turned off by correct_user method
    if @user.update_attributes(user_params)
      flash[:success] = "Changes has been saved"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed"
    redirect_to users_path
  end

  def following
    @title = "Following" # yielded by view
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers" # yielded by view
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # before filters

    # logged_in_user has been moved to ApplicationController
    # exercise 13.3.1.1
    # leaving 'logged_id_user' here will override method defined in application controller and changes made there wont affect UsersController
    # It is also code repetition

    # confirms the corrent user
    def correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user)
    end

    # confirms the admin user
    def admin_user
      redirect_to root_url unless current_user.admin?
    end

end
