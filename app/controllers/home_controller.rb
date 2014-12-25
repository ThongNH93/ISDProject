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

      # top_location=AdLocation.find_by("name = 'Top - Trang chi tiết báo'")
      # side_bar_location=AdLocation.find_by("name = 'Sidebar - Trang chi tiết báo'")
      # @top_ad=top_location.ad_order
      # @side_bar=side_bar_location.ad_order
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

     # top_location=AdLocation.find_by("name = 'Top - Trang chi tiết blog'")
     # side_bar_location=AdLocation.find_by("name = 'Sidebar - Trang chi tiết blog'")
     # @top_ad=top_location.ad_order
     # @side_bar=side_bar_location.ad_order

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
    # raise(params[:search])
    @search = Sunspot.search(Article) do
    # @search= Article.solr_search do
      # fulltext params[:search]
      keywords params[:search]
    end
    @results = @search.results
    # raise(@results.size.to_s)

    render 'home/search_result_page'
  end

  def about

  end

  def blogger_account

  end

  def blogger_upload_article

  end

  def blogger_edit_article

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
