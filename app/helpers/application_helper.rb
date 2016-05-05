module ApplicationHelper
  
  
  def find_all_courses
    @courses=Course.all
  end
end
