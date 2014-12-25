ActiveAdmin.register AdCustomer do

  menu parent: 'Quản lý Quảng Cáo ', label: "Quản lý khách hàng"

  permit_params :name, :email, :address, :credit_card, :email, :phone

  filter :name, label: "Tên"
  filter :address, label: "Địa chỉ"
  filter :email, label: "Email"
  filter :phone,label: "Số điện thoại"
  filter :credit_card, label: "Credit card"

  index title:"Danh sách khách hàng" do
    selectable_column
    id_column
    column "Tên", :name
    column "Địa chỉ", :address
    column "Email", :email
    column "Số điện thoại", :phone do |customer|
      number_to_phone(customer.phone)
    end
    column "Credit card", :credit_card
  end

  show  do |customer|
    panel "Thông tin khách hàng" do
      attributes_table_for customer do
        row('Khách hàng'){ customer.name}
        row('Địa chỉ')  { customer.address}
        row('Email') {customer.email}
        row ('Số điện thoại'){ number_to_phone(customer.phone)}
        row ('Credit card'){customer.credit_card}
        row ('Số lượng quảng cáo'){customer.ad_orders.size}
        row ('Tổng số tiền quảng cáo'){
          number_to_currency(customer.ad_orders.sum(:cost), unit: "VNĐ", separator: ",", delimiter: ".", format: "%n %u")}
      end
    end
    panel "Danh sách quảng cáo" do
      orders= customer.ad_orders
      # raise(orders.size.to_s)
      table_for(orders)  do |t|
        t.column("STT"){|order| auto_link order}
        t.column("Vị trí") {|order| auto_link order.ad_location.name  }
        t.column("Giá") do  |order|

          number_to_currency(order.cost, unit: "VNĐ", separator: ",", delimiter: ".", format: "%n %u")
        end
        t.column('Ngày bắt đầu') {|order|order.started_date.to_s}
        t.column ('Ngày hết hạn'){|order| order.expired_date.to_s}
      end
    end
  end

end
