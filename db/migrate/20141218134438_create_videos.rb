class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :image
      t.string :video
      t.string :author
      t.integer :status_id
      t.integer :admin_user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
