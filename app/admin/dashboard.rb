ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    
    columns do      
      Status.all.each do |status|
        column do    
          panel "#{status.title} Projects" do
            table_for Project.where("status_id = ?", status).limit(5) do
              column :title do |project|
                div :class => "sidebar-project-title" do
                  link_to project.title, admin_project_path(project)   
                end
              end
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
            end
          end
        end      
      end
    end

    
    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
