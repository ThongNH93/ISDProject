class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name, :dob, :gender, :address, :phone, :profile_image
  validates_uniqueness_of :email

  mount_uploader :profile_image, ImageUploader
  has_many :articles
  has_many :videos
end
