class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :client_id
      t.integer :sales_id
      t.integer :designer_id
      t.integer :markup_id
      t.integer :developer_id
      t.integer :marketplace_id
      t.integer :category_id
      t.integer :department_id
      t.string :title
      t.text :description
      t.text :special_notes
      t.float :price
      t.float :bonus
      t.float :fine
      t.float :marketplace_fee
      t.datetime :awarded_on
      t.datetime :started_on
      t.datetime :ended_on
      t.string :duration
      t.string :url
      t.string :remark
      t.integer :status_id

      t.timestamps
    end
  end
end
