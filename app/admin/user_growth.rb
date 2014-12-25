ActiveAdmin.register_page "User Growth"  do
  content do
    @metric =Article.group_by_week(:created_at).count
    render :partial => 'metrics/line_chart', :locals => {:metric => @metric}
  end

end