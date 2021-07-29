class FollowsController < ApplicationController
  before_action :authenticate_user!
 
  def create
    current_user.active_relationships.create(target_user_id: params[:user_id])
    user.create_notification_follow!(current_user)
    user = User.find(params[:user_id])
    

    #binding.pry
    redirect_to [:user, { id: params[:user_id] }]
  end
 
  def destroy
    
    current_user.active_relationships.find_by(target_user_id: params[:user_id]).destroy
    if params[:follow_destroy_where] == "mypage"
      
      redirect_to user_followings_path
    else  
      redirect_to [:user, { id: params[:user_id] }]
    end
  end
end
