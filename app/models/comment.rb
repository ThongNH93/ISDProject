class Comment < ActiveRecord::Base
  validates_presence_of :name, :email, :content,:status
  belongs_to :article
  belongs_to :blog
end
