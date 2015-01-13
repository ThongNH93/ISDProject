ActiveAdmin.register ViewsStatistic do

  actions :all, except: [ :destroy, :show, :edit, :new]
  menu label: "Thống kê truy cập "
  before_filter :skip_sidebar!, :only => :index

  index title:"Thống kê truy cập trang web" do
    @categories
    @metric =  ViewsStatistic.group_by_day(:created_at).sum(:views)
    # @pie_chart_data= ViewsStatistic.group(:created_at).sum(:views)
    @pie_chart_data= Hash.new
    Category.all.each do |category|
      category_total_views=category.views.sum(:views)
      @pie_chart_data[category.name]=category_total_views
    end
    @pie_chart_data["Blog"]=ViewsStatistic.all.where(:blog_id => !nil).sum(:views)
    render :partial => 'charts/views_statistics_chart', :locals => {:metric => @metric,:pie_chart_data  => @pie_chart_data}
  end

end
