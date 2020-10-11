class PostsController < ApplicationController
  before_action :require_login, only: %i[new create edit update destroy]
  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(15)
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
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    # ここの書き方が全然思いつかなかった
    if @post.update(post_params)
      redirect_to posts_path, success: '投稿を更新しました'
    else
      flash.now[:danger] = '投稿の更新に失敗しました'
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  # ここの書き方全然思いつかなかった
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy!
    redirect_to posts_path, success: '投稿を削除しました'
  end

  private

  def post_params
    params.require(:post).permit(:body, images: [])
  end
end
