class FollowsController < ApplicationController
  before_action :authenticate_user!
 
  def create
    current_user.active_relationships.create(target_user_id: params[:user_id])
    
    user = User.find(params[:user_id])
    user.create_notification_follow!(current_user)

    #binding.pry
    redirect_to [:user, { id: params[:user_id] }]
  end

  def notification_change
    follow = current_user.active_relationships.find_by(target_user_id: params[:user_id])
    if follow.notification == false
      if follow.update(notification: "true")
        redirect_to [:user, { id: params[:user_id] }], notice: "通知オンにしました。"  
      else
        redirect_to [:user, { id: params[:user_id] }], notice: "通知設定が変更できませんでした。もう一度お試しください。"
      end 
    else
      if follow.update(notification: "false")
        redirect_to [:user, { id: params[:user_id] }], notice: "通知オフにしました。"  
      else
        redirect_to [:user, { id: params[:user_id] }], notice: "通知設定が変更できませんでした。もう一度お試しください。"
      end 
    end
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
