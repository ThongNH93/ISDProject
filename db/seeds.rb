# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdLocation.create!(name: 'Top', ordered: false )
AdLocation.create!(name: 'Sidebar 1st - Trang chuyên mục báo',  ordered: false  )
AdLocation.create!(name: 'Sidebar 1st - Trang chi tiết báo' , ordered: false )
AdLocation.create!(name: 'Sidebar 1st - Trang danh sách video' , ordered: false )
AdLocation.create!(name: 'Sidebar 1st - Trang danh sách blog' , ordered: false )
AdLocation.create!(name: 'Sidebar 1st - Trang chi tiết blog' , ordered: false )
AdLocation.create!(name: 'Sidebar 2nd - Trang nhất', ordered: false )
AdLocation.create!(name: 'Sidebar 2nd - Trang chuyên mục báo',  ordered: false  )
AdLocation.create!(name: 'Sidebar 2nd - Trang chi tiết báo' , ordered: false )
AdLocation.create!(name: 'Sidebar 2nd - Trang danh sách video' , ordered: false )
AdLocation.create!(name: 'Sidebar 2nd - Trang danh sách blog' , ordered: false )
AdLocation.create!(name: 'Sidebar 2nd - Trang chi tiết blog' , ordered: false )

#the highest role with all the permissions.
Role.create!(:name => "Super Admin")

#other role
Role.create!(:name => "Staff")

#create a universal permission
Permission.create!(:subject_class => "all", :action => "manage")

#assign super admin the permission to manage all the models and controllers
role = Role.find_by_name('Super Admin')
role.permissions << Permission.find(:subject_class => 'all', :action => "manage")

# create a user and assign the super admin role to him.
user = User.new(:name => "Prasad Surase", :email => "prasad@joshsoftware.com", :password => "prasad", :password_confirmation => "prasad")
user.role = role
user.save!

User.create(:name => "Neo", email => "neo@matrix.com", :password => "the_one", :password_confirmation => "the_one", :role_id => Role.find_by_name('Staff').id)