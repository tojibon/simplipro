ActiveAdmin.register AdminUser do

  permit_params :email, :password, :password_confirmation, :is_sales, :is_designer, :is_markup, :is_developer, :is_client, :full_name, :country, :company, :address, :im, :tel, :fax, :special_notes
   
  sidebar "More for ", only: [:show, :edit] do
    ul do
      li link_to("Tickets", "admin_project_tickets_path(project)")
      li link_to("Milestones", "admin_project_milestones_path(project)")
    end
  end
  
  sidebar "Projects related to this user!", :only => :show do
    if admin_user.is_client
      table_for(Project.where("client_id = ? || sales_id = ? || designer_id = ? || markup_id = ? || developer_id = ?", admin_user.id, admin_user.id, admin_user.id, admin_user.id, admin_user.id).limit(5)) do
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
  
  
  scope :all
  scope :client do
    AdminUser.where('is_client = true')
  end
  scope :sales do
    AdminUser.where('is_sales = true')
  end
  scope :designer do
    AdminUser.where('is_designer = true')
  end
  scope :markup do
    AdminUser.where('is_markup = true')
  end
  scope :developer do
    AdminUser.where('is_developer = true')
  end
    
    

  index do
    selectable_column
    id_column
    column :full_name
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :full_name
  filter :email
  filter :is_client
  filter :country
  filter :address
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :full_name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :is_sales
      f.input :is_designer
      f.input :is_markup
      f.input :is_developer
      f.input :is_client
      f.input :country, as: :select, collection: country_dropdown
      f.input :company
      f.input :address
      f.input :im
      f.input :tel
      f.input :fax
      f.input  :special_notes
      
    end
    f.actions
  end

end
