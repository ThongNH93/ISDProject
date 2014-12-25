class Blog < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates_presence_of :title,:description, :content, :author ,:image,:status,:blogger_id
  validates_uniqueness_of :title

  belongs_to :blogger
  has_many :views_statistics
  has_many :comments

end
