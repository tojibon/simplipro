class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :project_id
      t.integer :client_id
      t.datetime :paid_on
      t.float :amount

      t.timestamps
    end
  end
end
