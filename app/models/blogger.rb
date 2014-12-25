class Blogger < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :profile_image, ImageUploader
  validates_presence_of  :email
  validates_uniqueness_of :email
  # validates_format_of :email, :with => "/^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i"
  validates_confirmation_of :password

  has_many :blogs
end
