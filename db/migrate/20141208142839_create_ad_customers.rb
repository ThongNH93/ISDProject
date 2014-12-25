class CreateAdCustomers < ActiveRecord::Migration
  def change
    create_table :ad_customers do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone
      t.string :credit_card

      t.timestamps
    end
  end
end
