class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy, :approve]

  def index
    # Логика posts_by перенесена в Модель
    @posts = Post.posts_by(current_user).order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @post = Post.new
  end

  def approve
    authorize @post
    @post.approved!
    redirect_to root_path, notice: "Post approved"
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
    authorize @post
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to @post, notice: "Post was update successfylly"
    else
      render :edit
    end
  end

  def destroy
    @post.delete
    redirect_to posts_path, notice: "Post was deleted"
  end

  private

  def post_params
    params.require(:post).permit(:date, :work_perform, :status, :daily_hours)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
