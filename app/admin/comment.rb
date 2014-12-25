ActiveAdmin.register Comment do

    menu parent: "Quản lý nội dung ", label: "Quản lý bình luận"

    permit_params :name,:email, :content, :article_id
    filter :article_id, label: "Bài báo", :as => :select, :collection => proc {Article.all}
    filter :blog_id,  label: "Blog", :as => :select, :collection => proc {Blog.all}
    filter :status, label: "Trạng thái", :as => :select, :collection =>["LOẠI","CHỜ DUYỆT","DUYỆT"]
    filter :created_at, label: "Ngày đăng"

    index title:"Danh sách bình luận" do
      selectable_column
      id_column
      column "Bài viết" do |comment|
        if comment.article.present?
          comment.article.title
        else
          comment.blog.title
        end
      end
      column  "Tên", :name
      column  "Email", :email
      column "Trạng thái", :status do |article|
        status_tag(article.status, if article.status.eql?("Loại")
                                     :error
                                   elsif article.status.eql?("Chờ duyệt")
                                     :warning
                                   else
                                     :ok
                                   end)
      end
      column "Ngày đăng", :created_at
      actions
    end
    controller do
      before_filter :only => :index do
        @per_page = 6
      end
      def show
        @comment=Comment.find(params[:id])
        show!
      end

      def status
        @id = params[:id]
        @status = params['/admin/comments/' + @id][:status_id]
        @comment = Comment.find(@id)
        @comment.update(:status => @status)

        redirect_to admin_comments_path
      end
    end
    sidebar :comment, :partial => "admin/approve_comment", :only => :show
end
