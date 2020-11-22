class LikesController < ApplicationController
  before_action :require_login, only: %i[create destroy]

  def create
    # 全然わからなかったので模写
    @post = Post.find(params[:post_id])
    current_user.like(@post)
  end

  def destroy
    # 全然わからなかったので模写
    @post = Like.find(params[:id]).post
    current_user.unlike(@post)
  end

  private

  def post_params
    params.require(:like).permit(:user_id, :post_id,)
  end
end