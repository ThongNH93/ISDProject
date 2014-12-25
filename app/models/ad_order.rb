class AdOrder < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates_presence_of :ad_customer_id, :ad_location_id, :expired_date ,:cost, :image
  validates_uniqueness_of :ad_location_id

  belongs_to :ad_customer
  belongs_to :ad_location
end