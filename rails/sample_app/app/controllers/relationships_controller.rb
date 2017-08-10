class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:followed_id]) # find id of previewed user
    current_user.follow(@user) # add previewed user to current user's followings
    respond_to do |format|
      format.html { redirect_to @user } # commenting out fail assertion in line 30
      format.js # commenting out do not fails anything
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user } # commenting out fail assertion in lines 45
      format.js # commenting out do not fails anything
    end
  end

end
