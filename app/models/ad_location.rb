class AdLocation < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  has_one :ad_order
  has_one :ad_price_list
end
