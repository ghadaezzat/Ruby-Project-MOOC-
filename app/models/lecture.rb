class Lecture < ActiveRecord::Base
  belongs_to :user , :class_name => "User", :foreign_key => "user_id"
  belongs_to :course , :class_name => "Course", :foreign_key => "course_id"
  mount_uploader :attachment, AttachmentsUploader
  acts_as_votable

end
