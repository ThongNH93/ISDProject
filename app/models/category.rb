class Category < ActiveRecord::Base
  validates_presence_of :name

  has_paper_trail
  has_and_belongs_to_many :articles
  has_many :videos
  has_many :views, :through => :articles, :source => :views_statistics

  accepts_nested_attributes_for :articles, :allow_destroy => true

end
