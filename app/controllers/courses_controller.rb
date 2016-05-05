class CoursesController < ApplicationController
  before_action :find_course , only: [:edit ,:show, :update , :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @courses=Course.all
  end
  
  def new
    @course=current_user.courses.new
  end
  
  def create
    @course=current_user.courses.new(course_params)
    if @course.save
      redirect_to root_path
    else
      redirect_to 'new'
    end
  end
  
  def show

  end
  def edit
    
  end
  
  def update
    if @course.update(course_params)
      redirect_to course_path(@course) 
    else
      render 'edit'
    end  
   
  end
  
  def destroy
    @course.destroy
    redirect_to root_path
  end
  
  private
      def course_params
        params.require(:course).permit(:title)
      end
      
      def find_course
        @course= Course.find(params[:id])
      end
end
