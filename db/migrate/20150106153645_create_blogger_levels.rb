class CreateBloggerLevels < ActiveRecord::Migration
  def migrate(direction)
    super
    BloggerLevel.create(name: 'Sơ cấp',avatar: 'socap.png',views: 50) if direction == :up
  end
  def change
    create_table :blogger_levels do |t|
      t.string :name
      t.string :avatar
      t.integer :views

      t.timestamps
    end
  end
end
