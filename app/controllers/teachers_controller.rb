class TeachersController < ApplicationController
    
    before_action :authenticate_teacher!, :only => [:edit, :update]
    
  def show
       @teacher = Teacher.find(params[:id])
  end

  def index
      @teachers = User.all
  end

  def edit
      @teacher = Teacher.find(params[:id])
    if @teacher.id == current_teacher.id
    else
      redirect_to "/comments"
      flash[:alert] = "無効なユーザー"
    end
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.id == current_teacher.id
      @teacher.update(params.require(:teacher).permit(:first_name, :family_name, :self_introduction))
    else
      redirect_to "/comments"
      flash[:alert] = "無効なユーザー"
    end
  end

end
