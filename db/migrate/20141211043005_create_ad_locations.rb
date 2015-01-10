class CreateAdLocations < ActiveRecord::Migration
	def migrate(direction)
      super
      # Create a default user
      AdLocation.create!(name: 'Top', ordered: false )if direction == :up

      AdLocation.create!(name: 'Sidebar 1st - Trang nhất', ordered: false )if direction == :up
      AdLocation.create!(name: 'Sidebar 1st - Trang chuyên mục báo',  ordered: false  )if direction == :up
      AdLocation.create!(name: 'Sidebar 1st - Trang chi tiết báo' , ordered: false )if direction == :up
      AdLocation.create!(name: 'Sidebar 1st - Trang danh sách video' , ordered: false )if direction == :up
      AdLocation.create!(name: 'Sidebar 1st - Trang danh sách blog' , ordered: false )if direction == :up
      AdLocation.create!(name: 'Sidebar 1st - Trang chi tiết blog' , ordered: false )if direction == :up
      AdLocation.create!(name: 'Sidebar 1st - Trang search' , ordered: false )if direction == :up

      AdLocation.create!(name: 'Sidebar 2nd - Trang nhất', ordered: false )if direction == :up
      AdLocation.create!(name: 'Sidebar 2nd - Trang chi tiết báo' , ordered: false )if direction == :up
      AdLocation.create!(name: 'Sidebar 2nd - Trang chuyên mục báo',  ordered: false  )if direction == :up
      AdLocation.create!(name: 'Sidebar 2nd - Trang danh sách video' , ordered: false )if direction == :up
      AdLocation.create!(name: 'Sidebar 2nd - Trang danh sách blog' , ordered: false )if direction == :up
      AdLocation.create!(name: 'Sidebar 2nd - Trang chi tiết blog' , ordered: false )if direction == :up
      AdLocation.create!(name: 'Sidebar 2nd - Trang search' , ordered: false )if direction == :up

  end
 def change
    create_table :ad_locations do |t|
      t.string :name
      t.string :image
      t.boolean :ordered

      t.timestamps
    end
  end
end
