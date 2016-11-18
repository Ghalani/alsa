class CreateStoredStocks < ActiveRecord::Migration
  def change
    create_table :stored_stocks do |t|
      t.references  :organization, index: true
      t.references  :stock_item, index: true
      t.references  :storage
      t.references  :incoming_stock
      t.integer     :quantity
      t.timestamps null: false
    end
  end
end
