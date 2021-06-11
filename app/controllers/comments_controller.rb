class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy ]
  
  def create
    @comment = Comment.new(comment_params)
    binding.pry
    if @comment.save
      respond_to do |format|
        format.js
      end 
    else
      render combo_path(@comment.combo.id)
    end
    #{render json: @comments}
    #binding.pry
    #@combo = Combo.find(params[:combo_id])
    #@comment = @combo.comments.build(comment_params)
    #@comments = @combo.comments.includes(:user)
    #@comment.user_id = current_user.id
    
    #@comment.save
    #非同期処理の場合
    #render :index
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    #非同期処理の場合
    render :index
    
    
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :combo_id).merge(user_id: current_user.id)
  end

end