class CommentsController < ApplicationController
  before_action :require_login, only: %i[create edit update destroy]

  def create
    # commentは必ずpostに紐づいているので、どのpostのcommentなのかという情報が必要になる
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.save!
    # @comment = current_user.comments.build(comment_params)
    # @comment.save!
  end

  def edit
    # 該当のpostに対するログインユーザーのコメント
    @comment = current_user.comments.find(params[:id])
  end

  def update
    @comment = current_user.comments.find(params[:id])
    @comment.update(comment_update_params)
  end

  def show
    
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id, post_id: @post.id)
  end

  def comment_update_params
    params.require(:comment).permit(:body)
  end
end
