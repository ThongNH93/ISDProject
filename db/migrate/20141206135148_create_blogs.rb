class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :description
      t.text :content
      t.string :image
      t.integer :blogger_id
      t.string :status
      t.string  :author

      t.timestamps
    end
  end
end
