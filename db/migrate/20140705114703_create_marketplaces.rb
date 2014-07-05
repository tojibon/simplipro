class CreateMarketplaces < ActiveRecord::Migration
  def change
    create_table :marketplaces do |t|
      t.string :title

      t.timestamps
    end
  end
end
