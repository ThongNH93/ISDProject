class Category < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name

  has_and_belongs_to_many :articles
  has_many :videos
  has_many :views, through: :articles, source: :views_statistics
end
