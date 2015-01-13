ActiveAdmin.register Article do

  menu parent: 'Quản lý nội dung ', label: "Quản lý bài viết"

  filter :title, label: "Tiêu đề"
  filter :author, label: "Tác giả"
  filter :categories, label: "Chuyên mục"
  filter :status_id,label: "Trạng thái", :as => :select, :collection => proc {Status.all}
  filter :created_at, label: "Ngày đăng"

  member_action :history do
    @post = Article.find(params[:id])
    @versions = @post.versions
    render "admin/history"
  end

  permit_params :admin_user_id, :title, :description, :content, :author ,:image, category_ids: []

  # if @str.eql?'1'
  #   actions :all, except: [:change_password, :destroy,:create]
  # else
  #   actions :all
  # end

  form(:html => { :multipart => true }) do |f|
    f.inputs "Article" do
      # f.input :admin_user_id, :as => :hidden,   input_html: { value: current_admin_user.id.to_i }
      f.input :title, label: "Tiêu đề"
      f.input :categories, label: "Chuyên mục", :as => :check_boxes,      :collection => Category.all
      f.input :description, label: "Tóm tắt"
      f.input :author, label: "Tác giả"
      f.input :content, label: "Nội dung", input_html: {class: 'ckeditor' }
      f.input :image, label:"Hình ảnh", :as => :file
      # f.input :image, :hint => f.template.image_tag(f.object.image.url(:thumb))

    end
    f.actions
  end

  before_create do |article|
    begin
      article.admin_user_id = current_admin_user.id
      article.status_id=Status.find_by_name("Chờ duyệt").id
    rescue => e
      logger.warn "Error: #{e}"
    end
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
    column  "Chuyên mục",:categories do |article|
      (article.categories.map{|category| category.name}).join(' - ').html_safe
    end
    column "Lượt xem", :views do |article|
      #calcualte total view off current date
      article.views_statistics.sum(:views)
    end
    column "Trạng thái", :status_id do |article|
      status_tag(article.status.name, if article.status.name.eql?("Loại")
                                        :error
                                      elsif article.status.name.eql?("Chờ duyệt")
                                        :warning
                                      else
                                        :ok
                                      end)
    end
    column "Ngày dăng", :created_at
    column "Ngày chỉnh sửa", :updated_at
    actions
  end

  show do |article|
    div  style:"width:800px"  do
      div class: "ccr-article" do
        h1 style:"color: #0063dc; font-family: 'Times New Roman'; font-size: 2em" do
          article.title
        end
        div "Post by "+ article.author+ " on "+ article.created_at.to_s
        br
        div style:"color: #40454D; font-family: 'Times New Roman'; font-size: 1.4em" do
          article.description
        end
        br
        text_node article.content.html_safe
      end
    end
    @post = Article.find(params[:id])
    @versions = @post.versions

  end


  controller do

    def show
      @post = Article.find(params[:id])
      @versions = @post.versions
      @post = @post.versions[params[:version].to_i].reify if params[:version]
      show! #it seems to need this
    end
    def status
      raise(params['/admin/articles/' + @id][:status_id])
      @id = params[:id]
      @status = params['/admin/articles/' + @id][:status_id]
      @article = Article.find(@id)
      @article.update(:status_id => @status)
      redirect_to admin_articles_path
    end

  end
  sidebar "Version", :partial => "admin/version", :only => :show, style: "margin-right:200px"
  sidebar "Kiểm duyệt nội dung", :partial => "admin/approve_article", :only => :show
end
