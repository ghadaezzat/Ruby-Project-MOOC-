class LecturesController < ApplicationController
  
  before_action :find_course 
  before_action :find_lecture ,only: [:show]
  before_action :authenticate_user!, only: [:new]
  
  def index
    @lectures=Lecture.all
  end
  
  def new
    @lecture=Lecture.new
  end
  
  def create
    @lecture=Lecture.new(lecture_params)
    @lecture.course_id=@course.id
    @lecture.user_id=current_user.id
    if @lecture.save
      redirect_to course_path(@course)
    else
      redirect_to 'new'
    end
  end
  
  def show
  end
  
  private
      def find_lecture
        @lecture = Lecture.find(params[:id])
      end
      def find_course
        @course = Course.find(params[:course_id])
      end
      def lecture_params
        params.require(:lecture).permit(:content ,:attachment)
      end

  
end
