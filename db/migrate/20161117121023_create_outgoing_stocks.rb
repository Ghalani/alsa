class CreateOutgoingStocks < ActiveRecord::Migration
  def change
    create_table :outgoing_stocks do |t|
      
      t.references  :organization, index: true
      t.references  :stock_item, index: true
      t.references  :storage
      t.references  :ordered_stock
      t.integer     :quantity
      t.belongs_to  :requester_id, class_name:"User"
      t.belongs_to  :releaser_id, class_name:"User"

      t.timestamps null: false
    end
  end
end
