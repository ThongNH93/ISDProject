class CreateViewsStatistics < ActiveRecord::Migration
  def change
    create_table :views_statistics do |t|
      t.integer  :views

      t.integer :article_id
      t.integer :blog_id

      t.timestamps
    end
  end
end
