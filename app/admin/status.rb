ActiveAdmin.register Status do

  
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
    permitted = [:title, :color, :background_color]
  end
  
  filter :title
  filter :color
  filter :background_color
  filter :created_at
  filter :updated_at
  
  index do
    column :id 
    column :title do |status|
      div :class=>"sidebar-project-status", :style=>"color: #{status.color}; background-color: #{status.background_color};" do
        status.title
      end
    end
    column :created_at
    column :updated_at
    actions
  end
  
end
