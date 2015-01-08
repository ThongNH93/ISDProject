class Blogger < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models
  mount_uploader :profile_image, ImageUploader
  validates_presence_of  :email
  validates_uniqueness_of :email
  validates_confirmation_of :password

  belongs_to :blogger_level
  has_many :blogs
end
