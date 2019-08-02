class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post), flash: { success: "Post successfully created." }
    else
      render("new")
    end
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to post_path(@post), flash: { info: "post successfully updated." }
    else
      render("edit")
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, flash: { info: "Post was successfully destroyed." }

  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :picture)
    end
end
