ActiveAdmin.register Payment do

  
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
    permitted = [:project_id, :client_id, :paid_on, :amount]
  end
  
  sidebar "This Projects#101 Payment Stats!", :only => [:new, :show, :edit] do
    "Needs to show currently selected projects payment stats so far"
  end
  
  sidebar "This Clients#101 Payment Stats!", :only => [:new, :show, :edit] do
    "Needs to show currently selected clients payment stats so far"
  end
  
  sidebar :help, :partial => "new_payment_help_partial"
  
  
  form do |f|
    f.inputs "Payment Details" do
      f.input :project
      f.input :client
      f.input :paid_on
      f.input :amount
      
    end
    f.actions
  end

end
