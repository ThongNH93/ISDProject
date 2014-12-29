ActiveAdmin.register AdLocation do

  menu parent: 'Quản lý Quảng Cáo ', label: "Quản lý vị trí quảng cáo"

  permit_params :name, :image, :ordered

  before_filter :skip_sidebar!, :only => :index
  actions :all, except: [:change_password, :destroy, :new]

  index title:"Danh sách vị trí quảng cáo" do
    selectable_column
    id_column
    column "Hình ảnh", :image do |order|
      image_tag (order.image), width: 100
    end
    column "Tên vị trí", :name
    column "Trạng thái", :ordered  do |location|
      status_tag(location.ordered.eql?(true)? 'Đã đặt' : 'Còn trống', location.ordered.eql?(true)? :warning : :ok)
    end
    column "Ngày tạo", :created_at
    column "Ngày sửa", :updated_at
  end
  show  do |location|
    panel "Vị trí quảng cáo" do
      attributes_table_for location  do
        if location.ad_order.present?
          row ('Hình ảnh quảng cáo'), :image do
            image_tag (location.image.url)
          end
          row('Khách hàng')do
            link_to location.ad_order.ad_customer.name, admin_ad_customer_path(location.ad_order.ad_customer)
          end
          row('Vị trí quảng cáo')  {location.name}
          row('Trạng thái') {status_tag(location.ordered.eql?(true)? 'Đã đặt' : 'Còn trống', location.ordered.eql?(true)? :warning : :ok)}
          row ('Ngày hết hạn') do
              location.ad_order.expired_date.to_s
          end
          row('Giá') do
            number_to_currency(location.ad_order.cost, unit: "VNĐ", separator: ",", delimiter: ".", format: "%n %u")
          end
        else
          row ('Hình ảnh quảng cáo'), :image do
            image_tag (location.image.url)
          end
          row('Vị trí quảng cáo')  {location.name}
          row('Trạng thái') {status_tag(location.ordered.eql?(true)? 'Đã đặt' : 'Còn trống', location.ordered.eql?(true)? :warning : :ok)}
          row('Đơn Giá') do
            if location.ad_price_list.present?
              number_to_currency(location.ad_price_list.price, unit: "VNĐ", separator: ",", delimiter: ".", format: "%n %u")
            else
            "Chưa có"
            end
          end
          row('Thời gian')  {
             if location.ad_price_list.present?
              location.ad_price_list.duration
             else
              "Chưa có"
              end
          }
        end
      end
    end
  end
end
