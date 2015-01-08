ActiveAdmin.register BloggerLevel do
  menu parent: 'Quản lý Blog ', label: "Quản lý blogger level"

  before_filter :skip_sidebar!, :only => :index

  permit_params :name,:avatar,:views
  form(:html => { :multipart => true }) do |f|
    f.inputs "Cấp độ" do
      f.input :name, label: "Cấp độ"
      f.input :views, label: "Số lượng view"
      f.input :avatar, label:"Avatar", :as => :file
      # f.input :image, :hint => f.template.image_tag(f.object.image.url(:thumb))

    end
    f.actions
  end

  index title:"Danh sách cấp độ" do
    selectable_column
    id_column
    column "Hình ảnh", :avatar do |blogger_level|
      image_tag (blogger_level.avatar.url), width: 100
    end
    column  "Tên", :name
    column  "Số lượng views", :views
    column "Ngày tạo", :created_at
    column "Ngày chỉnh sửa", :updated_at
    actions
  end

  show title:"Chi tiết cấp độ" do |blogger_level|
    panel "Thông tin cấp độ" do
      attributes_table_for blogger_level  do
        row ('Avatar'){image_tag (blogger_level.avatar.url), width: 100}
        row('Tên cấp độ'){blogger_level.name}
        row('Số lượng views')  {blogger_level.views}
        row('Ngày tạo') {blogger_level.created_at}
        row ('Ngày chỉnh sửa'){blogger_level.created_at}

      end
    end
  end
end
