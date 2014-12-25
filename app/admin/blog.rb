ActiveAdmin.register Blog do

  @str='2'
  if @str.eql?'2'
    menu parent: 'Quản lý Blog ', label: "Quản lý bài viết"
  end
  filter :title, label: "Tiêu đề"
  filter :author, label: "Tác giả"
  filter :status, label: "Trạng thái"
  filter :created_at, label: "Ngày đăng"

  permit_params :blogger_id, :title, :description, :content, :author ,:image,:status
  if @str.eql?'1'
    actions :all, except: [:update, :destroy,:create]
  else
    actions :all
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs "Blog" do
      f.input :blogger_id, :as => :select, :collection => Blogger.pluck(Arel.sql("CONCAT(`first_name`,`last_name`)"), :id)
      f.input :title, label: "Tiêu đề"
      f.input :description, label: "Tóm tắt"
      f.input :author, label: "Tác giả"
      f.input :content, label: "Nội dung", input_html: {class: 'ckeditor'}
      f.input :image, label:"Hình ảnh", :as => :file
      # f.input :image, :hint => f.template.image_tag(f.object.image.url(:thumb))

    end
    f.actions
  end

  before_create do |blog|
    blog.status="Chờ duyệt"
  end

  before_filter :only => :index do
    @per_page = 10
  end
  index title:"Danh sách bài viết" do
    selectable_column
    id_column
    column "Hình ảnh", :image do |article|
      image_tag (article.image.url), width: 100
    end
    column  "Tiêu đề", :title
    column  "Tác giả", :author

    column "Lượt xem", :views do |blog|
      #calcualte total view off current date
      blog.views_statistics.sum(:views)
    end
    column "Trạng thái", :status do |blog|
      status_tag(blog.status, if blog.status.eql?("Loại")
                                        :error
                                      elsif blog.status.eql?("Chờ duyệt")
                                        :warning
                                      else
                                        :ok
                                      end)
    end
    column "Ngày đăng", :created_at
    column "Ngày sửa", :updated_at
    actions
  end

  show do |blog|
    panel "Chi tiết bài viết" do
      div class: "ccr-article"  do
        h1 blog.title
        text_node "Post by "+ blog.author+ " on "+ blog.created_at.to_s
        text_node blog.content.html_safe
      end
    end
  end


  controller do

    def show
      @blog = Blog.find(params[:id])
    end
    def status
      @id = params[:id]
      @status = params['/admin/blogs/' + @id][:status]
      @blog = Blog.find(@id)
      @blog.update(:status => @status)
      redirect_to admin_blogs_path
    end

  end
  sidebar "Kiểm duyệt nội dung", :partial => "admin/approve_blog", :only => :show
end
