class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :object_type
      t.string :action

      t.timestamps
    end
  end
end
