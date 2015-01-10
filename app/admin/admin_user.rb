ActiveAdmin.register AdminUser do

  menu parent: 'Quản trị admin ', label: "Quản lý admin"

  permit_params :email, :password, :password_confirmation, :first_name, :last_name, :gender, :dob, :address, :phone, :profile_image

  index title:"Danh sách admin" do
    selectable_column
    id_column
    column "Hình ảnh", :image do |admin|
      image_tag (admin.profile_image.url), width: 100
    end
    column  "Họ và tên" do |admin|
      admin.first_name.to_s.concat(" "+admin.last_name.to_s)
    end
    column "Chức danh" do |admin|
      admin.role.name
    end
    column  "Ngày sinh", :dob
    column  "Email", :email
    column  "Giới tính", :gender
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form(:html => { :multipart => true }) do |f|
    f.inputs "admin" do
      f.input :first_name, :label => "Họ và tên đệm"
      f.input :last_name, :label => "Tên"
      f.input :dob, label: "Ngày sinh", :as => :datepicker
      f.input :email, label: "Email"
      f.input :password, label: "Mật khẩu"
      f.input :password_confirmation, label: "Xác nhận mật khẩu"
      f.input :phone, label: "Điện thoại"
      f.input :address, label: "Địa chỉ"
      f.input :gender, label: "Giới tính", :as => :radio, :collection => ["Nam", "Nữ"]
      f.input :profile_image , label: "Ảnh đại diện", :as => :file
      # f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url)
    end
    f.actions
  end
  show do |admin_user|
    panel "Thông tin admin" do
      attributes_table_for admin_user  do
        row ('Ảnh đại diện'), :image do
          image_tag (admin_user.profile_image), width: 100
        end
        row('Chức danh'){admin_user.role.name}
        row('Họ và tên'){admin_user.first_name.to_s.concat(" "+admin_user.last_name.to_s)}
        row('Giới tính') {admin_user.gender}
        row ('Email'){ admin_user.email}
        row('Ngày sinh'){admin_user.dob}
        row('Địa chỉ'){admin_user.address}
        row('Điện thoại'){admin_user.phone}
      end
    end

    @articles= Article.all.where(:admin_user_id => current_admin_user.id).order("created_at DESC").page(params[:page]).per_page(10)
    @videos= Video.all.where(:admin_user_id => current_admin_user.id).order("created_at DESC").page(params[:page]).per_page(10)

    # raise(@articles.size.to_s)
    render :partial => 'admin/admin_table', :locals => {:articles => @articles,:videos  => @videos}
  end

end
