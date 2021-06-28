class FollowingsController < ApplicationController
  def index
    @followings = User.find(params[:user_id]).followings
    @user = User.find(params[:user_id])
  end
end
