class HomeController < ApplicationController
   before_action :set_categories, :side_bar, :top_ad

  def index
     begin
        @categories_articles= Hash.new
        approved_priority=Status.find_by(:name => "Duyệt").priority

        @popular_articles= Article.joins(:status,:views_statistics).where('statuses.priority >= ?',approved_priority).order('views_statistics.views DESC').limit(5).uniq

        article_ids=Array.new
        @hot_news=Article.joins(:status,:views_statistics).where('statuses.priority >= ?',approved_priority).order('statuses.priority DESC').order('views_statistics.views DESC').limit(4).uniq
        article_ids=@hot_news.ids
        @latest_news=  Article.joins(:status).where('statuses.priority >= ?',approved_priority).where('articles.id not IN (?) ',article_ids).order('articles.created_at DESC').limit(4).uniq
        article_ids+=@latest_news.ids

        @categories.each do |category|
          articles=category.articles.joins(:status).where('articles.id not IN (?)',article_ids).where('statuses.priority >= ?',approved_priority).order('statuses.priority DESC').limit(5).uniq
          @categories_articles[category]=articles
        end

        @side_bar_1st=AdLocation.find_by("name = 'Sidebar 1st - Trang nhất'").ad_order
        @side_bar_2nd=AdLocation.find_by("name = 'Sidebar 2nd - Trang nhất'").ad_order

     rescue

     end
   end
  def articles
    begin
      approved_priority=Status.find_by(:name => "Duyệt").priority
      @category= Category.find(params[:id])
      @articles =@category.articles.joins(:status).where('statuses.priority >= ?',approved_priority).order('statuses.priority DESC').paginate(:page => params[:page], :per_page => 7).uniq

      @popular_articles=Article.joins(:articles_categories,:status,:views_statistics).where(articles_categories:{category_id: @category.id}).where('statuses.priority >= ?',approved_priority).order('views_statistics.views DESC').limit(5).uniq

      @side_bar_1st=AdLocation.find_by("name = 'Sidebar 1st - Trang chuyên mục báo'").ad_order
      @side_bar_2nd=AdLocation.find_by("name = 'Sidebar 2nd - Trang chuyên mục báo'").ad_order
    rescue
    end
  end
  def article
    begin

      approved_priority=Status.find_by(:name => "Duyệt").priority

      @article= Article.find(params[:id])
      @comments=@article.comments.where("status = 'Duyệt'")
      @related_posts=Article.joins(:articles_categories,:status).where(articles_categories:{category_id: @article.categories.first.id}).where('statuses.priority >= ? ',approved_priority).where('articles.id != ?',@article.id).order('statuses.priority DESC').limit(4).uniq
      # @popular_posts= Article.joins(:status,:views_statictic).where('statuses.priority >= ?',@approved_priority).order('views_statistics.views').except(@article.id).limit(5)
      @popular_articles= Article.joins(:status,:views_statistics).where('statuses.priority >= ?',approved_priority).where('articles.id != ?',@article.id).order('views_statistics.views DESC').limit(5).uniq


      if ViewsStatistic.find_by_article_id(@article.id).blank?
        new_view=ViewsStatistic.new
        new_view.update(:views => 1)
        new_view.update(:article_id =>@article.id)
      else
        current_view=ViewsStatistic.all.where('article_id =?',@article.id).order('created_at DESC').first
        current_view_day=current_view.created_at
        current_day=Date.current
        if(current_view_day.day!=current_day.day)
           # raise(current_view_day.day.to_s)
          new_view=ViewsStatistic.new
          new_view.update(:views => 1)
          new_view.update(:article_id =>@article.id)
        else
          current_view.update(:views => current_view.views+1)
        end
      end

      @side_bar_1st=AdLocation.find_by("name = 'Sidebar 1st - Trang chi tiết báo'").ad_order
      @side_bar_2nd=AdLocation.find_by("name = 'Sidebar 2nd - Trang chi tiết báo'").ad_order
    rescue

    end
  end
  def article_comment
     begin
       id = params[:id]
       name = params['/home/article/' + id][:name]
       email= params['/home/article/' +id][:email]
       content=params['/home/article/' +id][:content]
       comment = Comment.create
       comment.name=name
       comment.email=email
       comment.content=content
       comment.status= "Chờ duyệt"
       comment.article_id=id

       comment.save!

       if comment.save
         flash[:success] = 'Your comment was successfully added!'
         redirect_to home_article_path(id)
       else
         flash[:alert] = 'Unable to create user'
         redirect_to home_article_path(id)
       end
     rescue
    end
  end

   #create Blogs controller for blog page
   def blogs
     # begin
       @blogs=Blog.all.where(:status => "Duyệt").order(:created_at).paginate(:page => params[:page], :per_page => 7).uniq

       @popular_blogs=Blog.joins(:views_statistics).where(:status => "Duyệt").order('views_statistics.views DESC').limit(5).uniq
       # @popular_blogs=Blog.where(:status => "Duyệt").limit(5)
       # raise(@popular_blogs.size.to_s)

       @side_bar_1st=AdLocation.find_by("name = 'Sidebar 1st - Trang danh sách blog'").ad_order
       @side_bar_2nd=AdLocation.find_by("name = 'Sidebar 2nd - Trang danh sách blog'").ad_order
     # rescue
     # end
   end
   def blog
     @blog=Blog.find(params[:id])
     @comments=@blog.comments.where("status = 'Duyệt'")
     @popular_blogs=Blog.joins(:views_statistics).where(:status => "Duyệt").order('views_statistics.views DESC').limit(5).uniq
     @related_posts=Blog.where(:status => "Duyệt").where('blogs.id != ?',@blog.id).limit(4).uniq
     if ViewsStatistic.find_by_blog_id(@blog.id).blank?
       new_view=ViewsStatistic.new
       new_view.update(:views => 1)
       new_view.update(:blog_id =>@blog.id)
     else
       current_view=ViewsStatistic.all.where('blog_id =?',@blog.id).order('created_at DESC').first
       current_view_day=current_view.created_at
       current_day=Date.current
       if(current_view_day.day!=current_day.day)
         # raise(current_view_day.day.to_s)
         new_view=ViewsStatistic.new
         new_view.update(:views => 1)
         new_view.update(:blog_id =>@blog.id)
       else
         current_view.update(:views => current_view.views+1)
       end
     end

     @side_bar_1st=AdLocation.find_by("name = 'Sidebar 1st - Trang chi tiết blog'").ad_order
     @side_bar_2nd=AdLocation.find_by("name = 'Sidebar 2nd - Trang chi tiết blog'").ad_order
   end
   def blog_comment
     begin
       id = params[:id]
       name = params['/home/blog/' + id][:name]
       email= params['/home/blog/' +id][:email]
       content=params['/home/blog/' +id][:content]
       comment = Comment.create
       comment.name=name
       comment.email=email
       comment.content=content
       comment.status= "Chờ duyệt"
       comment.blog_id=id

       comment.save!

       if comment.save
         flash[:success] = 'Your comment was successfully added!'
         redirect_to home_blog_path(id)
       else
         flash[:alert] = 'Unable to create user'
         redirect_to home_blog_path(id)
       end
     rescue
     end
   end


  def tong_hop_video
    begin
      @tong_hop_videos= Hash.new
      approved_priority=Status.find_by(:name => "Duyệt").priority

      @popular_videos= Video.joins(:status).where('statuses.priority >= ?',approved_priority).order('videos.created_at DESC').limit(5)

      @categories.each do |category|
        videos=category.videos.joins(:status).where('statuses.priority >= ?',approved_priority).order('videos.created_at DESC').order('statuses.priority DESC').limit(4)
        @tong_hop_videos[category]=videos
      end

      @side_bar_1st=AdLocation.find_by("name = 'Sidebar 1st - Trang danh sách video'").ad_order
      @side_bar_2nd=AdLocation.find_by("name = 'Sidebar 2nd - Trang danh sách video'").ad_order
    rescue
    end
    render "home/videos"
  end
  def videos
    approved_priority=Status.find_by(:name => "Duyệt").priority
    category=Category.find(params[:id])
    @videos=category.videos.joins(:status).where('statuses.priority >= ?',approved_priority).order('videos.created_at DESC').order('statuses.priority DESC').paginate(:page => params[:page], :per_page => 10).uniq
    @popular_videos= Video.joins(:status).where('statuses.priority >= ?',approved_priority).order('videos.created_at DESC').limit(5).uniq

    @side_bar_1st=AdLocation.find_by("name = 'Sidebar 1st - Trang danh sách video'").ad_order
    @side_bar_2nd=AdLocation.find_by("name = 'Sidebar 2nd - Trang danh sách video'").ad_order
  end
  def search
    raise(params[:search])
    @search = Sunspot.search(Article) do
    # @search= Article.solr_search do
      # fulltext params[:search]
      keywords params[:search]
    end
    @results = @search.results
    # raise(@results.size.to_s)

    render 'home/search_result_page'
  end

  def blogger_view_blog
    @blogger=Blogger.find(current_blogger.id)
    @blog=Blog.find(params[:id])
  end
  def blogger_account
    @blogger=Blogger.find(params[:id])
    @all_blogs=@blogger.blogs.joins(:views_statistics).where(:blogger_id => @blogger.id).order("views_statistics.views DESC").paginate(:page => params[:page], :per_page => 7).uniq
    @new_blogs=@blogger.blogs.where(:blogger_id => @blogger.id).order(:created_at).paginate(:page => params[:page], :per_page => 7).uniq
    @approved_blogs=@blogger.blogs.where(:blogger_id => @blogger.id).where(:status=> 'Duyệt').order(:created_at).paginate(:page => params[:page], :per_page => 7).uniq
    @unapproved_blogs=@blogger.blogs.where(:blogger_id => @blogger.id).where(:status=> 'Chờ duyệt').order(:created_at).paginate(:page => params[:page], :per_page => 7).uniq

    @current_tab="TẤT CẢ"
  end
  def blogger_upload_article_form
    @blog= Blog.create
  end
  def blogger_upload_article
    @blogger=Blogger.find(params[:id])
    begin
      id = params[:id]
      image = params['/home/blogger/' + params[:id]+"/upload"][:image]
      title = params['/home/blogger/' + params[:id]+"/upload"][:title]
      author= params['/home/blogger/' + params[:id]+"/upload"][:author]
      description= params['/home/blogger/' + params[:id]+"/upload"][:description]
      content= params[:content]

      if content.present?
        @blog =Blog.create
        @blog.update(image: image)
        @blog.update(title: title)
        @blog.update(author: author)
        @blog.update(description: description)
        @blog.update(content: content)
        @blog.update(status: 'Chờ duyệt')
        @blog.update(blogger_id: @blogger.id)
        @blog.save!
        flash[:success] = 'Bạn đã đăng 1 bài viết!'
        redirect_to home_blogger_account_path(current_blogger.id)
      else
        flash[:alert] ='Nội dung bài viết bị trống!'
        redirect_to home_blogger_upload_article_form_path
      end

    rescue Exception => exc
      flash[:alert] = exc.message
      redirect_to home_blogger_upload_article_form_path
    end
  end
  def blogger_edit_article_form
   @blog= Blog.find(params[:id])
 end
  def blogger_edit_article
   @blogger=Blogger.find(params[:id])
   begin
     id = params[:id]
     image = params['/home/blogger/' + params[:id]+"/edit_article"][:image]
     title = params['/home/blogger/' + params[:id]+"/edit_article"][:title]
     author= params['/home/blogger/' + params[:id]+"/edit_article"][:author]
     description= params['/home/blogger/' + params[:id]+"/edit_article"][:description]
     content= params[:content]

     if content.present?
       @blog =Blog.find(params[:id])
       @blog.update(image: image)
       @blog.update(title: title)
       @blog.update(author: author)
       @blog.update(description: description)
       @blog.update(content: content)
       @blog.update(status: 'Chờ duyệt')
       @blog.save!
       flash[:success] = 'Bạn đã đăng 1 bài viết!'
       redirect_to home_blogger_account_path(current_blogger.id)
     else
       flash[:alert] ='Nội dung bài viết bị trống!'
       redirect_to home_blogger_edit_article_form_path, data: @blog
     end

   rescue Exception => exc
     flash[:alert] = exc.message
     redirect_to home_blogger_edit_article_form_path
   end
 end
  def blogger_change_password_form
    @blogger=Blogger.find(params[:id])
  end
  def blogger_change_password
    # # params.require(:blogger).permit(:first_name, :last_name, :email,:address,:phone,:gender,:profile_image)
    # raise(params.require(:blogger).permit(:password).to_s)
      @blogger=Blogger.find(params[:id])
     begin
       id = params[:id]
       password = params['/home/blogger/' + params[:id]+"/change_password"][:password]
       confirm_password= params['/home/blogger/' + params[:id]+"/change_password"][:password_confirmation]
       # current_password=params['/home/blogger/' + params[:id]+"/change_password"][:current_password]
       if password.eql?(confirm_password)
         @blogger.update_attribute(:password,password)
         @blogger.save!
         flash[:alert] = 'Đổi mật khẩu thành công'
         redirect_to home_blogger_account_path(id)
       else

         flash[:alert] ='Mật khẩu xác nhận không đúng'
         redirect_to home_blogger_change_password_form_path
        end

     rescue
       flash[:alert] ='Mật khẩu phải dài hơn 4 kí tự'
       redirect_to home_blogger_change_password_form_path
     end
   end

  def rss_page
  end
  def category_rss
    approved_priority=Status.find_by(:name => "Duyệt").priority

    @category= Category.find(params[:id])
    @articles= @category.articles.joins(:status).where('statuses.priority >= ?',approved_priority).order('statuses.priority DESC')
    @blogs = Blog.all.where(:status => "Duyệt").order(:created_at)
    render :template => 'home/category_rss.xml.builder',layout: false
  end
  def blog_rss
    @blogs =Blog.all.where(:status => "Duyệt").order(:created_at)
    render :template => 'home/category_rss.xml.builder',layout: false
  end
  def about

   end

  private
# # Use callbacks to share common setup or constraints between actions.
  def set_categories
    @categories = Category.all
  end

  def side_bar
    @youtube_link=Video.all.first
  end

  def top_ad
    @top_location=AdLocation.find_by("name = 'Top'")
  end

end
