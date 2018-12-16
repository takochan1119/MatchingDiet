class CommentsController < ApplicationController
    
  def show
      @comment = Comment.find(params[:id])
      @teacher = Teacher.find(@comment.teacher_id)
  end

  def index
      @comments = Comment.all
  end

  def new
      @comment = Comment.new
  end

  def create
      @comment = Comment.create(params.require(:comment).permit(:content,:teacher_id).merge(:teacher_id => current_teacher.id))
      @teacher = Teacher.find(@comment.teacher_id)
  end

  def edit
      @comment = Comment.find(params[:id])
      @teacher = Teacher.find(@comment.teacher_id)
  if @comment.teacher_id == current_teacher.id
    else
      redirect_to "/comments"
      flash[:alert] = "無効なユーザー"
  end
  end

  def update
    @comment = Comment.find(params[:id])
    @teacher = Teacher.find(@comment.teacher_id)
    if @comment.teacher_id == current_teacher.id
       @comment.update(params.require(:comment).permit(:content))
    else
      redirect_to "/comments"
      flash[:alert] = "無効なユーザー"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @teacher = Teacher.find(@comment.teacher_id)
    if @comment.teacher_id == current_teacher.id
      @comment.destroy
    else
      redirect_to "/comments"
      flash[:alert] = "無効なユーザー"
    end
  end
end
