ActiveAdmin.register AdPriceList do

  menu parent: 'Quản lý Quảng Cáo ', label: "Quản lý giá quảng cáo"

  permit_params :price, :duration, :ad_location_id
  # filter :ad_location_id, label: "Vị trí", :as => :select, :collection => proc { AdLocation.pluck(Arel.sql("CONCAT(`name`, '-', `place`)"), :id)}
  filter :ad_location_id, label: "Vị trí", :as => :select, :collection => proc { AdLocation.all}
  filter :price,  label: "Giá"
  filter :duration, label: "Thời gian", :as => :select, :collection => proc{AdPriceList.pluck(:duration)}

  form(:html => { :multipart => true }) do |f|
    f.inputs "Vị trí quảng cáo" do
      f.input :ad_location_id, label: "Vị trí", :as => :select, :collection => AdLocation.all
      f.input :price, label: "Giá"
      f.input :duration, label: "Thời gian"
    end
    f.actions
  end

  index title:"Bảng giá quảng cáo" do
    selectable_column
    id_column
    column  "Vị trí", :ad_location_id do |location|
      location.ad_location.name
    end
    column "Thời gian", :duration
    column "Giá", :price do |price|
      number_to_currency(price.price, unit: "VNĐ", separator: ",", delimiter: ".", format: "%n %u")

    end
    column "Ngày tạo", :created_at do |price|
      price.created_at
  end
    column "Ngày sửa", :updated_at do |price|
      price.updated_at
    end
    actions
  end
  show do |ad_price_list|
    panel "Chi tiết giá" do
      attributes_table_for ad_price_list  do
        row('Vị trí'){ auto_link(ad_price_list.ad_location )}
        row('Giá'){ number_to_currency(ad_price_list.price, unit: "VNĐ", separator: ",", delimiter: ".", format: "%n %u")}
        row('Thời lượng'){ad_price_list.duration}
      end
    end
  end
end
