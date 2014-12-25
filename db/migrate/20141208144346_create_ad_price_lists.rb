class CreateAdPriceLists < ActiveRecord::Migration
  def change
    create_table :ad_price_lists do |t|
      t.float :price
      t.string :duration
      t.integer :ad_location_id

      t.timestamps
    end
  end
end
