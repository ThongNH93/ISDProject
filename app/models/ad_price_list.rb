class AdPriceList < ActiveRecord::Base

  validates_presence_of :price,:duration, :ad_location_id
  validates_uniqueness_of :ad_location_id

  belongs_to :ad_location
end
