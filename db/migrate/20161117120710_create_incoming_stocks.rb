class CreateIncomingStocks < ActiveRecord::Migration
  def change
    create_table :incoming_stocks do |t|
      t.references :organization, index: true
      t.references :stock_item, index: true
      t.references :stock_source, index: true
      t.belongs_to :receiver_id, class_name: "User"
      t.integer    :quantity
      t.datetime   :arrived_at
      t.timestamps null: false
    end
  end
end
