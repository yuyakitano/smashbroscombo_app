class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy ]
  
  def create
    @comment = Comment.new(comment_params)
    
    if @comment.save
      combo = @comment.combo
      combo.create_notification_comment!(current_user, @comment.id)
      
      respond_to do |format|
        format.json
      end 
    else
      render combo_path(@comment.combo.id)
    end
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