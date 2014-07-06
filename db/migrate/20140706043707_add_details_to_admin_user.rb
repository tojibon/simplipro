class AddDetailsToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :full_name, :string
    add_column :admin_users, :im, :string
    add_column :admin_users, :country, :string
    add_column :admin_users, :company, :string
    add_column :admin_users, :address, :string
    add_column :admin_users, :tel, :string
    add_column :admin_users, :fax, :string
    add_column :admin_users, :special_notes, :text
  end
end
