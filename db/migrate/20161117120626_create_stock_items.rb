class CreateStockItems < ActiveRecord::Migration
  def change
    create_table :stock_items do |t|
      t.references  :organization, index: true
      t.references  :stock_type, index: true
      t.string      :name
      t.integer     :cost # in coins div(100)
      t.integer     :minimum_quantity
      t.jsonb       :extra, array: true, default: []
      t.timestamps null: false
    end
  end
end
