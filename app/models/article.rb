class Article < ActiveRecord::Base
  # gem define
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models
  mount_uploader :image, ImageUploader
  has_paper_trail

  validates_presence_of :title,:description, :content, :author ,:image, :categories
  validates_uniqueness_of :title

  has_and_belongs_to_many :categories
  belongs_to :admin_user
  has_many :comments
  has_many :views_statistics
  belongs_to :status, -> {order('priority DESC')}

  accepts_nested_attributes_for :categories, :allow_destroy => true



  # searchable  do
  Sunspot.setup(Article) do
    text :title, :description, :content
  end
end
