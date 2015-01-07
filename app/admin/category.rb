ActiveAdmin.register Category do

  menu parent: 'Quản lý nội dung ', label: "Quản lý chuyên mục"

  permit_params :name
  before_filter :only => :index do
    @per_page = 10
  end

  index title:"Danh sách chuyên mục" do
    selectable_column
    id_column
    column "Tên chuyên mục", :name
    column "Số lươt truy cập" do |category|
      views=0
      category.articles.each do |article|
        views+=article.views_statistics.sum(:views)
      end
      views
    end
    column "Tổng số bài viết" do |category|
      category.articles.size
    end
    column "Ngày tạo", :created_at do |category|
      category.created_at.to_s
    end
    column "Ngày sửa", :updated_at do |category|
      category.updated_at.to_s
    end
    actions
  end

  show do |category|
    panel "Thông tin chuyên mục" do
      attributes_table_for category do
        row("Tên chuyên mục"){ category.name}
        row("Số lượt truy cập") do
          views=0
          category.articles.each do |article|
            views+=article.views_statistics.sum(:views)
          end
          views
        end
        row("Tổng số bài viết")do |category|
          category.articles.size
        end
        row("Ngày tạo"){ category.created_at}
        row("Ngày chỉnh sửa"){ category.updated_at}
      end
    end
  end
  form do |f|
    f.inputs "Chuyên mục" do
      f.input :name
    end
    f.actions
  end

end
