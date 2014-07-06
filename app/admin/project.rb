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
  
  
  sidebar "More from this Client!  ", only: [:show] do
    ul do
      li link_to("Tickets", "admin_project_tickets_path(project)")
      li link_to("Milestones", "admin_project_milestones_path(project)")
    end
  end
  
  # Create sections on the index screen
  scope :all
  Status.all.each do |status|
    scope "#{status.title}" do
      Project.where('status_id = ?', status.id)
    end
  end
  
  #scope :client do
  #  AdminUser.where('is_client = true')
  #end
  
  # Customize columns displayed on the index screen in the table
  index do
    column :title do |project|
      link_to project.title, admin_project_path(project)
    end
    column :category
    column "Price", :sortable => :price do |project|
      div :class => "price" do
        number_to_currency project.price
      end
    end
    column :status do |project|
      div :class => "sidebar-project-status", :style => "color: #{project.status.color}; background-color: #{project.status.background_color};" do
        project.status.title
      end
    end
    column :started_on
    column :ended_on
    actions
  end
  
  sidebar "Other Projects from this client!", :only => :show do
    table_for(Project.where("client_id = ? and id != ?", project.client_id, project).limit(5)) do
      column "Title", :title do |project|
        div :class => "sidebar-project-title" do
          link_to project.title, admin_project_path(project)  
        end
      end
      column "Status", :status do |project|
        div :class => "sidebar-project-status", :style => "color: #{project.status.color}; background-color: #{project.status.background_color};" do
          project.status.title
        end
      end
    end
  end
  
end
