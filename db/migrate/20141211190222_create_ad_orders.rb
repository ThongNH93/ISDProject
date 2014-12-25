class CreateAdOrders < ActiveRecord::Migration
  def change
    create_table :ad_orders do |t|
      t.integer :ad_customer_id
      t.integer :ad_location_id
      t.datetime :started_date
      t.datetime :expired_date
      t.float :cost
      t.string :image

      t.timestamps
    end
  end
end