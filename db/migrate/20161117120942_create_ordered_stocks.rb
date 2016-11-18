class CreateOrderedStocks < ActiveRecord::Migration
  def change
    create_table :ordered_stocks do |t|
      t.references  :organization, index: true
      t.references  :stock_item, index: true
      t.references  :customer_order, index: true
      t.belongs_to  :receiver_id, class_name:"User"
      t.integer     :quantity
      t.integer     :cost

      t.timestamps null: false
    end
  end
end
