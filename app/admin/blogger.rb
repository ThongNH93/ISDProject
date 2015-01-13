ActiveAdmin.register Blogger do

  menu parent: 'Quản lý blog ', label: "Quản lý blogger"

  permit_params :email, :blogger_level_id, :password, :first_name , :last_name, :dob, :password_confirmation, :phone, :address, :gender, :profile_image, :active

  filter :blog, label: 'Blog'
  filter :email, label: "Email"
  filter :first_name, label: "Họ và tên đệm"
  filter :last_name, label: "Tên"
  filter :dob, label: 'Ngày sinh'
  filter :phone, label:' Số điện thoại'
  filter :gender, label: 'Giới tính'
  filter :address, label: 'Địa chỉ'
  filter :status, label: 'Trạng thái'
  filter :created_at, label: "Ngày đăng"

  form(:html => { :multipart => true }) do |f|
    f.inputs "blogger" do
      f.input :blogger_level_id, label: "Cấp độ",:as => :select, :collection => BloggerLevel.all
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

  before_create do |blogger|
    blogger.active=false
    blogger.save!
  end
  before_filter :only => :index do
    @per_page = 10
  end
  index title:"Danh sách blogger" do
    begin
      selectable_column
      id_column
      column "Hình ảnh", :image do |blogger|
        image_tag (blogger.profile_image.url), width: 100
      end
      column  "Họ và tên" do |blogger|
        blogger.first_name.to_s.concat(" "+blogger.last_name.to_s)
      end
      column "Cấp độ" do |blogger|
        blogger.blogger_level.name
      end
      column  "Ngày sinh", :dob
      column  "Email", :email
      column  "Giới tính", :gender
      column "Trạng thái", :active do |blogger|
        status_tag(blogger.active.eql?(true)? 'Active' :'Deactive', blogger.active.eql?(true)? :ok : :error)
      end
      column "Ngày tạo", :created_at
      column "Ngày sửa", :updated_at
      actions
    rescue
    end
  end
  show  do |blogger|
    panel "Thông tin blogger" do
      attributes_table_for blogger  do
        row ('Ảnh đại diện'), :image do
          image_tag (blogger.profile_image.url), width: 100
        end
        row('Cấp độ') {blogger.blogger_level.name}
        row('Tên và tên'){blogger.first_name.to_s.concat(" "+blogger.last_name.to_s)}
        row ('Cấp độ'){auto_link blogger.blogger_level}
        row('Giới tính') {blogger.gender}
        row ('Email'){ blogger.email}
        row('Ngày sinh'){blogger.dob}
        row('Địa chỉ'){blogger.address}
        row('Điện thoại'){blogger.phone}
        row('Trạng thái'){status_tag(blogger.active.eql?(true)? 'Active' :'Deactive', blogger.active.eql?(true)? :ok : :error)}

      end
    end
    panel "Danh sách bài viết" do
      blogs= blogger.blogs
      # raise(orders.size.to_s)
      table_for(blogs)  do |t|
        t.column("STT"){|blog| auto_link blog}
        t.column("Tiêu đề") {|blog| auto_link blog.title  }
        t.column("Trạng thái") do |blog|
          status_tag(blog.status, if blog.status.eql?("Loại")
                                    :error
                                  elsif blog.status.eql?("Chờ duyệt")
                                    :warning
                                  else
                                    :ok
                                  end)
        end
        t.column("Ngày đăng") {|blog| blog.created_at}
      end
    end
  end

  controller do

    def show
      @blogger=Blogger.find(params[:id])
      show!
    end

    def status

      id = params[:id]
      blogger= Blogger.find(id)
      status = params['/admin/bloggers/' + id][:active].eql?("Active")? true : false
      # raise(blogger.active.to_s)
      blogger.update!(:password => blogger.password)
      blogger.update!(:active => status)

      # raise(blogger.active.to_s)
      redirect_to admin_bloggers_path
    end
  end
  sidebar "Kiểm duyệt", :partial => "admin/active_deactive_blogger", :only => :show
end
