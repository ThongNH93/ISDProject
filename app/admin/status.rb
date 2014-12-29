ActiveAdmin.register Status do

  menu parent: 'Quản lý nội dung ', label: "Quản lý trạng thái"

  permit_params :name, :priority
  before_filter :skip_sidebar!, :only => :index

 actions :all, except: [:change_password, :destroy, :show, :edit]

  form(:html => { :multipart => true }) do |f|
    f.inputs "Độ ưu tiên" do
      f.input :name, label: "Tên"
      f.input :priority, label: "Độ ưu tiên"
      # f.input :image, :hint => f.template.image_tag(f.object.image.url(:thumb))

    end
    f.actions
  end
  sidebar :status, :only => :show do
    render 'user'
  end
  index title:"Danh sách trạng thái" do
    selectable_column
    id_column
    column "Tên", :name
    column "Độ ưu tiên", :priority
    column "Ngày tạo", :created_at
    # column "Ngày chỉnh sửa", :updated_at
    actions
  end
end
