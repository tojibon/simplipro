ActiveAdmin.register Department do

  
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
    permitted = [:title, :description]
  end
  
  filter :title
  filter :description
  filter :created_at
  filter :updated_at
  
  index do
    selectable_column
    id_column
    column :title
    column :description
    actions
  end
  
end
