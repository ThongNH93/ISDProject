class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.text :content
      t.integer :admin_user_id, null: false
      t.string :image
      t.integer :status_id, null: false
      t.string :author

      t.timestamps
    end
  end
end
