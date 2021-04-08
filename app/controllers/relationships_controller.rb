class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    current_user.follow(@user.id)
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(@user.id)
    redirect_to request.referer
  end

  def followings
    @users = @user.following
  end

  def followers
    @users = @user.followers
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

end
