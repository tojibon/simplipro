class AddIsDeveloperToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :is_developer, :boolean
  end
end
