class CommentsController < ApplicationController
    
  def show
      @comment = Comment.find(params[:id])
  end

  def index
      @comments = Comment.all
  end

  def new
      @comment = Comment.new
  end

  def create
      @comment = Comment.create(params.require(:comment).permit(:name, :content))
  end

  def edit
      @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(params.require(:comment).permit(:content))
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end
end
