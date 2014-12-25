class Video < ActiveRecord::Base
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models
  mount_uploader :image, ImageUploader
  has_paper_trail

  validates_presence_of :title,:image, :video, :author, :category_id
  validates_uniqueness_of :title, :video

  belongs_to :admin_user
  belongs_to :status
  belongs_to :category

  def set_success(format, opts)
    self.success = true
  end
end