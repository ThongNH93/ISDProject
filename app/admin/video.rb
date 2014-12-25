ActiveAdmin.register Video do

  menu parent: 'Quản lý nội dung ', label: "Quản lý Video"

  filter :category_id, label: "Chuyên mục", :as => :select, :collection => Category.all
  filter :title, label: "Tiêu đề"
  filter :author, label: "Tác giả"
  filter :categories, label: "Chuyên mục"
  filter :status_id,label: "Trạng thái", :as => :select, :collection => proc {Status.all}
  filter :created_at, label: "Ngày đăng"

  permit_params :title, :author ,:video, :image, :category_id,:video

  before_create do |article|
    article.admin_user_id = current_admin_user.id
    article.status_id=Status.find_by_name("Chờ duyệt").id
  end
  before_filter :only => :index do
    @per_page = 10
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs "Video" do
      f.input :admin_user_id, :as => :hidden,  input_html: { value: current_admin_user.id.to_i }
      f.input :category_id, label: "Chuyên mục", :as => :select, :collection => Category.all
      f.input :title, label: "Tiêu đề"
      f.input :image, label: "Ảnh hiển thị", :as => :file
      f.input :author, label: "Tác giả"
      f.input :video, label:"Video Link( YouTube link)"

    end
    f.actions
  end

  index title:"Danh sách video" do
    selectable_column
    id_column
    column "Hình ảnh", :image do |video|
      image_tag (video.image.url) , width: 100
    end
    column  "Tiêu đề", :title
    column "Chuyên mục", :category_id do |video|
      video.category.name
    end
    column  "Tác giả", :author
    # column "Lượt xem", :views do |video|
    #   video.views_statistics.sum(:views)
    # end
    column "Trạng thái", :status_id do |video|
      status_tag(video.status.name, if video.status.name.eql?("Loại")
                                      :error
                                    elsif video.status.name.eql?("Chờ duyệt")
                                      :warning
                                    else
                                      :ok
                                    end)
    end
    column "Ngày dăng", :created_at
    column "Ngày chỉnh sửa", :updated_at
    actions
  end
  show do |video|
    panel "Chi tiết video" do
      attributes_table_for video do
        row("Hình ảnh") do
          image_tag (video.image), width: 100
        end
        row("Tiêu đề"){ video.title}
        row("Chuyên mục") {auto_link video.category}
        row("Tác giả"){ video.author}
        row :video, label: "Video" do
          ('<iframe  width="560" height="315"  src="'+video.video+'" frameborder="0" allowfullscreen></iframe>').html_safe
        end
      end
    end
  end

  controller do
    def create
      begin
        #video_raw_path form
        # <iframe width="560" height="315" src="//www.youtube.com/embed/yNH8CINm9Lg" frameborder="0" allowfullscreen></iframe>
        video_raw_path=params[:video][:video]

        video_url=video_raw_path.split(' ')[3].split('"')[1]
        # video_url form: //www.youtube.com/embed/yNH8CINm9Lg
        params[:video][:video]=video_url
      rescue

      end
      create!
    end

    def update
      begin
        #video_raw_path form
        # <iframe width="560" height="315" src="//www.youtube.com/embed/yNH8CINm9Lg" frameborder="0" allowfullscreen></iframe>
        video_raw_path=params[:video][:video]

        video_url=video_raw_path.split(' ')[3].split('"')[1]
        # video_url form: //www.youtube.com/embed/yNH8CINm9Lg
        params[:video][:video]=video_url
      rescue

      end
      update!
      # raise(params[:video][:id].to_s)
      # redirect_to edit_admin_video_path(params[:video][:id])
    end
    def show
      @post = Video.find(params[:id])
      @versions = @post.versions
      @post = @post.versions[params[:version].to_i].reify if params[:version]
      show! #it seems to need this
    end
    def status
      @id = params[:id]
      @status = params['/admin/videos/' + @id][:status_id]
      @video = Video.find(@id)
      @video.update(:status_id => @status)
      redirect_to admin_videos_path
    end

  end
  sidebar "Version", :partial => "admin/version", :only => :show
  sidebar "Kiểm duyệt nội dung", :partial => "admin/approve_video", :only => :show

end