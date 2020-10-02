class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: "Post was created successfully"
    else
      render :new
    end
  end

  def show
  end

  def edit

  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was update successfylly"
    else
      render :edit
    end
  end

  def destroy
    @post.delete
    redirect_to posts_path, alert: "Post was deleted"
  end

  private

  def post_params
    params.require(:post).permit(:date, :rationale)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
