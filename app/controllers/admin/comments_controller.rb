class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @comments = Comment.all
  end
  def create
    @comment = Comment.new(comment_params)
    
    if @comment.save
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
    render admin_comments_path
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :combo_id).merge(user_id: current_user.id)
  end

end