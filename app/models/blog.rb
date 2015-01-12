class Blog < ActiveRecord::Base
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models
  mount_uploader :image, ImageUploader
  has_paper_trail

  validates_presence_of :title,:description, :content, :author ,:image,:status,:blogger_id
  validates_uniqueness_of :title

  belongs_to :blogger
  has_many :views_statistics
  has_many :comments

end
