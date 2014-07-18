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
  
  
  sidebar "Project Payments!  ", only: [:edit] do
    render partial: "project_payment_partial", locals: {payment: payment, edit_mode: 'yes'}
  end
  
  sidebar "Client Payments!  ", only: [:edit] do
    render partial: "client_payment_partial", locals: {payment: payment, edit_mode: 'yes'}
  end
  
  sidebar "Project Payments!  ", only: [:new] do
    render partial: "project_payment_partial", locals: {edit_mode: 'no'}
  end
  
  sidebar "Client Payments!  ", only: [:new] do
    render partial: "client_payment_partial", locals: {edit_mode: 'no'}
  end
  
  sidebar :help,  :only => [:new, :edit, :show], :partial => "new_payment_help_partial"
  
  
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
