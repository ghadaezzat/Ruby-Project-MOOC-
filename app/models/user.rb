class User < ActiveRecord::Base
  has_many :courses
  has_many :lectures
  acts_as_voter
  acts_as_commontator



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name,
  :presence => true

  validates :gender,
  :presence => true

  validates :birthdate,
  :presence => true
end
