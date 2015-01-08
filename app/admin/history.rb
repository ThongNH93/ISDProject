ActiveAdmin.register_page  "History" do

  menu label: "Lịch sử hoạt động ", priority:5

  content title:"Lịch sử hoạt động" do
    @history=PaperTrail::Version.order('id desc').page(params[:page]).per_page(10)
    table_for @history do # Use PaperTrail::Version if this throws an error
      column ("Item") { |v| link_to v.item.to_s, [:admin, v.item] } # Uncomment to display as link
      column :event
      column ("Type") { |v| v.item_type.underscore.humanize }
      column ("Modified at") { |v| v.created_at.to_s :long }
      column ("Admin") { |v| link_to AdminUser.find(v.whodunnit).email, [:admin, AdminUser.find(v.whodunnit)] }
    end
    div paginate @history
  end
end