class PostsController < ApplicationController
    
  def show
      @post = Post.find(params[:id])
  end

  def index
      @posts = Post.all
  end

  def new
      @post = Post.new
  end

  def create
       @post = Post.create(params.require(:post).permit(:name, :content))
  end

  def edit
      @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(params.require(:post).permit(:content))
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end
end
