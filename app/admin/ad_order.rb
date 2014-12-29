ActiveAdmin.register AdOrder do

  menu parent: 'Quản lý Quảng Cáo ', label: "Quản lý đơn quảng cáo"

  permit_params :ad_customer_id, :ad_location_id,:started_date, :expired_date, :cost, :image

  filter :ad_customer_id, label: "Khách hàng", :as => :select, :collection => proc {AdCustomer.all}
  filter :ad_location_id, label: "Vị trí", :as => :select, :collection => proc { AdLocation.pluck(Arel.sql("CONCAT(`name`)"), :id)}
  filter :cost,  label: "Giá"
  filter :started_date, label: "Ngày order"
  filter :expired_date, label: "Ngày hết hạn"


  before_create do |order|
    # raise(order.image.to_s)
    order.ad_location.update(image: order.image)
    order.ad_location.update(ordered: true)
  end
  before_update do |order|
    old_location=AdLocation.find_by(order.ad_location_id)
    order.ad_location.update(image: order.image)
    order.ad_location.update(ordered: true)
     # raise(old_location.id.to_s)
    if !old_location.id.eql?(order.ad_location_id)
      old_location.update(ordered: false)
      old_location.update(image: nil)
      old_location.remove_image!
      old_location.save!
    end
  end
  before_destroy do |order|
    order.ad_location.update(ordered: false)
    order.ad_location.update(image: nil)
    order.ad_location.remove_image!
    order.ad_location.save!
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs "Đơn đặt hàng" do
      f.input :ad_customer_id, label: "Khách hàng", :as => :select, :collection => AdCustomer.all, include_blank: false
      # f.input :ad_location_id, label: "Vị trí", :as => :select, :collection => AdLocation.pluck(Arel.sql("CONCAT(`name`)"), :id)
      f.input :ad_location_id, label: "Vị trí", :as => :select, :collection => AdLocation.all,include_blank: false
      f.input :cost, label: "Giá hợp đồng"
      f.input :started_date, label: "Ngày bắt đầu",:as => :datepicker
      f.input :expired_date, label: "Ngày hết hạn",:as => :datepicker
      f.input :image, label:"Hình ảnh", :as => :file, :required => true
      # f.input :image, :hint => f.template.image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

  index title:"Danh sách đặt quảng cáo" do
    selectable_column
    id_column
    column "Hình ảnh quảng cáo", :image do |order|
      image_tag (order.image.url), width: 100
    end
    column  "Khách hàng",  :sortable => :ad_customer_id do |customer|
      customer.ad_customer.name
    end
    column  "Vị trí", :ad_location_id do |order|
      order.ad_location.name
    end
    column "Ngày bắt đầu",:sortable => :started_date do |order|
      order.started_date
    end
    column "Ngày hết hạn", :sortable => :expired_date  do |order|
      order.expired_date
    end
    column "Thời gian còn lại" do |order|
      remain_time=((order.expired_date.to_time - Time.current)/1.day).round
      status_tag(if remain_time < 0
                   "Quá "+remain_time.to_s + " ngày"
                 else
                   "Còn "+remain_time.to_s + " ngày"
                 end,
                 if remain_time <= 0
                   :error
                 elsif remain_time <= 1
                   :warning
                 else
                   :ok
                 end)
    end
    actions
  end
  show title:"Thông tin order" do |order|
    panel "Thông tin order" do
      attributes_table_for order  do
        row ('Hình ảnh quảng cáo'), :image do
          image_tag (order.image.url)
        end
        # row('Khách hàng'){link_to order.ad_customer.name, admin_ad_customer_path(order.ad_customer)}
        row('Khách hàng'){auto_link order.ad_customer}
        # row('Vị trí quảng cáo')  {link_to order.ad_location.name, admin_ad_location_path(order.ad_location)}
        row('Vị trí quảng cáo')  {auto_link order.ad_location}
        row('Ngày bắt đầu') {order.started_date.to_s}
        row ('Ngày hết hạn'){ order.expired_date.to_s}
        row ('Thời gian còn lại')do
          remain_time=((order.expired_date.to_time - Time.current)/1.day).round
          status_tag(if remain_time < 0
                      "Quá "+remain_time.to_s + " ngày"
                    else
                      "Còn "+remain_time.to_s + " ngày"
                    end,
                    if remain_time <= 0
                      :error
                    elsif remain_time <= 1
                      :warning
                    else
                      :ok
                    end)
          end
        row('Giá'){ number_to_currency(order.cost, unit: "VNĐ", separator: ",", delimiter: ".", format: "%n %u")}
      end
    end
  end
  sidebar "Danh sách vị trí quảng cáo" , :only => [:edit,:new] do
    list_locations= AdLocation.all
      table_for(list_locations)  do |t|
        t.column("Vị trí") {|location| auto_link location  }
        t.column("Giá") do  |location|
          if location.ad_price_list.present?
            number_to_currency(location.ad_price_list.price, unit: "VNĐ", separator: ",", delimiter: ".", format: "%n %u")
          else
          "Chưa có"
          end
        end
        t.column("Thời gian") do |location|
          if location.ad_price_list.present?
            location.ad_price_list.duration
          else
            "Chưa có"
          end
        end
        t.column("Tình trạng") do |location|
          status_tag(location.ordered.eql?(true)? 'Đã đặt' : 'Còn trống', location.ordered.eql?(true)? :warning : :ok)
        end

      end
    end
  controller do
    before_filter :only => :index do
      @per_page = 6
    end
  end
end