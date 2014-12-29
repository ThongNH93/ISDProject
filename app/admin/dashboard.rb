ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      # span class: "blank_slate" do
      #   span I18n.t("active_admin.dashboard_welcome.welcome")
      #   small I18n.t("active_admin.dashboard_welcome.call_to_action")
      # end
    end

    section "Recently updated content" do
      @history=PaperTrail::Version.order('id desc').page(params[:page]).per_page(10)
      table_for @history do # Use PaperTrail::Version if this throws an error
        column ("Item") { |v| link_to v.item, [:admin, v.item] } # Uncomment to display as link
        column :event
        column ("Type") { |v| v.item_type.underscore.humanize }
        column ("Modified at") { |v| v.created_at.to_s :long }
        column ("Admin") { |v| link_to AdminUser.find(v.whodunnit).email, [:admin, AdminUser.find(v.whodunnit)] }
      end
      div paginate @history
    end
    @metric =  ViewsStatistic.group_by_hour(:created_at).sum(:views)
    # @pie_chart_data= ViewsStatistic.group(:created_at).sum(:views)
    @pie_chart_data= Hash.new
    Category.all.each do |category|
      category_total_views=category.views.sum(:views)
      @pie_chart_data[category.name]=category_total_views
    end
    @pie_chart_data["Blog"]=ViewsStatistic.all.where(:blog_id => !nil).sum(:views)
    render :partial => 'metrics/line_chart', :locals => {:metric => @metric,:pie_chart_data  => @pie_chart_data}

  end # content
end
