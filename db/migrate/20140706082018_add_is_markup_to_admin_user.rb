class AddIsMarkupToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :is_markup, :boolean
  end
end
