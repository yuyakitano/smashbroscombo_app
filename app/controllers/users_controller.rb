class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy ]
  before_action :authenticate_admin!, only: [:index ]
  before_action :ensure_current_user, {only: [:edit, :update, :destroy]}
  def index
    @users = User.all

  end

  def show
    #@q = User.ransack(params[:q])
    #@user = @q.result(distinct: true).page(params[:page])
    @user = User.find(params[:id])
    if params[:combo] == 'followingcombo'
      @combo = Combo.where(user_id: [*current_user.following_ids])
    end
    #@combos = Combo.where(:user_id == @user.id).order('updated_at DESC')
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(params[:id]), notice: "ユーザー情報を更新しました"
    else
      # binding.pry
      render 'users/edit'
      # binding.pry
    end
    # user.update!(user_params)
    # redirect_to user_path(params[:id]), notice: "ユーザー情報を更新しました"
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to main_path, notice: "ユーザーを削除しました"
	end

  def combos
    return Combo.where(user_id: user.id)
  end

  #ログインユーザー自身のデータしか編集できない。
  
  def ensure_current_user
    
    if current_user.id != params[:id].to_i
      redirect_to combos_url, notice: "権限がありません"
    end
  end



  private
  def user_params
    params.require(:user).permit(:username, :email, :introduction, :profile_image)
  end
end
