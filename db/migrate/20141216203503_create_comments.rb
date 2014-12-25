class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :article_id
      t.integer :blog_id
      t.string :name
      t.string :email
      t.text :content
      t.string :status

      t.timestamps
    end
  end
end
