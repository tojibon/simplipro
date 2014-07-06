class AddIsDesignerToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :is_designer, :boolean
  end
end
