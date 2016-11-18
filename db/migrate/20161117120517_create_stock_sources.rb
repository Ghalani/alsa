class CreateStockSources < ActiveRecord::Migration
  def change
    create_table :stock_sources do |t|
      t.references :organization, index: true
      t.string  :name
      t.string  :email
      t.string  :phone
      t.string  :address
      t.timestamps null: false
    end
  end
end
