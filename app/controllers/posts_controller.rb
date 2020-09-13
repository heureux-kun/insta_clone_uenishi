class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    # build：データベースに登録する前でやめて、未保存のオブジェクトを得ることができる
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, success: '投稿しました'
    else
      flash.now[:danger ] = '投稿に失敗しました'
      render :new
    end
  end

  # ここの書き方全然思いつかなかった
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy!
    redirect_to posts_path, success: '投稿を削除しました'
  end

  def post_params
    params.require(:post).permit(:body, images: [])
  end
end
