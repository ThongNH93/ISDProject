class Status < ActiveRecord::Base

  validates_presence_of :name, :priority
  validates_uniqueness_of :name, :priority

  has_many :articles
  has_many :videos
end