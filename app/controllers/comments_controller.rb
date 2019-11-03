class CommentsController < ApplicationController

  def new
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.new
  end
  
  # commentを保存
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.topic_id = params[:topic_id]
    
    if @comment.save
      redirect_to topics_path, success: 'コメント入力に成功しました'
    else
      redirect_to topics_path, danger: 'コメントが空です'
    end
  
  end
  
  private
    # Commentモデル contentを許可
  def comment_params
    params.require(:comment).permit(:content)
  end
  

end
