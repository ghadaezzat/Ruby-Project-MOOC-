class LecturesController < ApplicationController
  
  before_action :find_course ,only: [:upvote ,:downvote] 
  before_action :find_lecture ,only: [:show ,:upvote ,:downvote]
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
  def upvote
    @lecture.upvote_from current_user
    redirect_to course_lecture_path
  end
  def downvote
    @lecture.downvote_from current_user
    redirect_to course_lecture_path 
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
