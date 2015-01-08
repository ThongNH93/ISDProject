class BloggerLevel < ActiveRecord::Base
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models
  mount_uploader :avatar, ImageUploader

  validates_presence_of :name, :avatar, :views
  validates_uniqueness_of :name

  has_one :blogger
end
