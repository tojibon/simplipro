ActiveAdmin.register Project do

  config.per_page = 50 
  
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
  scope :all
  Status.all.each do |status|
    scope "#{status.title}" do
      Project.where('status_id = ?', status.id)
    end
  end
  
  
  lastMonthsStart = 2.months.ago
  lastMonthsEnd = 1.months.ago
  scope "Last Months" do
    Project.where(:created_at => lastMonthsStart..lastMonthsEnd)
  end 
  
  thisMonthsStart = 1.months.ago
  thisMonthsEnd = 0.months.ago
  scope "This Months" do
    Project.where(:created_at => thisMonthsStart..thisMonthsEnd)
  end 
  
  
  filter :title
  filter :price
  filter :category_id, as: :select, :collection => Category.all
  filter :department_id, as: :select, :collection => Department.all
  filter :marketplace_id, as: :select, :collection => Marketplace.all
  filter :status_id, as: :select, :collection => Status.all
  filter :client_id, as: :select, :collection => Client.all
  filter :sales_id, as: :select, :collection => Sales.all
  filter :designer_id, as: :select, :collection => Designer.all
  filter :markup_id, as: :select, :collection => Markup.all
  filter :developer_id, as: :select, :collection => Developer.all
  filter :awarded_on
  filter :started_on
  filter :ended_on
  filter :remark
  
  #scope :client do
  #  AdminUser.where('is_client = true')
  #end
  
  # Customize columns displayed on the index screen in the table
  index do
    column :id
    column :title do |project|
      div :class => "grid-row-item-title" do  
        link_to project.title, admin_project_path(project)
      end  
    end
    column :category do |project|
      div :class => "grid-row-item-title" do  
        link_to project.category.title, admin_category_path(project.category)
      end  
    end
    column "Price", :sortable => :price do |project|
      div :class => "price" do
        @total_price = 0
        @total_price = ( ( project.price.to_f + project.bonus.to_f ) - ( project.fine.to_f + project.marketplace_fee.to_f ) )
        number_to_currency @total_price 
      end
    end
    column "Paid" do |project|
      div :class => "price" do
        @total_paid = 0
        if project.payment.any? 
          project.payment.each do |payment|
            @total_paid+=payment.amount.to_f
          end
        end
        number_to_currency @total_paid
      end
    end
    column "Due" do |project|
      div :class => "price" do
        @total_due = 0
        @total_price = 0
        @total_paid = 0
        @total_price = ( ( project.price.to_f + project.bonus.to_f ) - ( project.fine.to_f + project.marketplace_fee.to_f ) )
        if project.payment.any? 
          project.payment.each do |payment|
            @total_paid+=payment.amount.to_f
          end
        end
        @total_due = @total_price - @total_paid
        number_to_currency @total_due
      end
    end
    column :status do |project|
      div :class => "sidebar-project-status", :style => "color: #{project.status.color}; background-color: #{project.status.background_color};" do
        project.status.title
      end
    end
    column :ended_on
    
    actions
    
    #column "Action" do |project| 
    #  link_to "Edit", edit_admin_project(project) 
    #end
     
  end
  
  sidebar "New Payment!  ", only: [:show] do    
    render partial: "add_project_payments", locals: {project: project}
  end
  
  sidebar "Payment Summary!  ", only: [:show] do    
    render partial: "project_payments", locals: {project: project}
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
