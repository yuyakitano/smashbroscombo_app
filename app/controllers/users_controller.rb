class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy ]
  before_action :authenticate_admin!, only: [:index ]
  before_action :ensure_current_user, {only: [:edit, :update, :destroy]}
  def index
    @users = User.all

  end

  def show
    @user = User.find(params[:id])
    
    #@combos = Combo.where(:user_id == @user.id).order('updated_at DESC')
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    redirect_to user_path(params[:id]), notice: "ユーザー情報を更新しました"
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to combos_url, notice: "ユーザーを削除しました"
	end

  def combos
    return Combo.where(user_id: user.id)
  end

  #ログインユーザー自身のデータしか編集できない。
  
  # def ensure_current_user
    
  #   if current_user.id != params[:id].to_i
  #     redirect_to combos_url, notice: "権限がありません"
  #   end
  # end



  private
  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end
end
