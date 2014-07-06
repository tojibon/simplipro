class AddIsSalesToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :is_sales, :boolean
  end
end
