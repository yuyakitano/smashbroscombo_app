class UsersController < ApplicationController
  def index
    @users = User.all

  end

  def show
    @user = User.find(params[:id])
    #@combos = Combo.where(:user_id == @user.id).order('updated_at DESC')
    
  end

  def edit
  end

  def combos
    return Combo.where(user_id: user.id)
  end


end
