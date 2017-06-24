class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = session[:user_id]
    if @post.save
      flash[:success] = "New post created"
      redirect_to posts_path
    else
      flash.now[:info] = "Failed to create a post. Try once again"
      render 'new'
    end

  end

  def index
    @posts = Post.all
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end

    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to login_url # halts request cycle
      end
    end
end
