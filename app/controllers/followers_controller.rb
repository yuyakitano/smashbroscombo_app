class FollowersController < ApplicationController
  def index
    @followers = User.find(params[:user_id]).followers
    @user = User.find(params[:user_id])
  end
end
