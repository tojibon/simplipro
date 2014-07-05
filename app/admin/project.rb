ActiveAdmin.register Project do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
  permit_params do
    permitted = [:client_id, :sales_id, :designer_id, :markup_id, :developer_id, :marketplace_id, :category_id, :department_id, :title, :description, :special_notes, :price, :bonus, :fine, :marketplace_fee, :awarded_on, :started_on, :ended_on, :duration, :url, :remark, :status_id]
  end  
  
  
  # Create sections on the index screen
  scope :all, :default => false
  
  # Customize columns displayed on the index screen in the table
  index do
    column :title
    column :category
    column "Price", :sortable => :price do |project|
      div :class => "price" do
        number_to_currency project.price
      end
    end
    column :status
    column :started_on
    column :ended_on
    actions
  end
  
end
