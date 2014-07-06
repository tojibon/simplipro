class AddIsClientToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :is_client, :boolean
  end
end
