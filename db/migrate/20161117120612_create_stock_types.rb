class CreateStockTypes < ActiveRecord::Migration
  def change
    create_table :stock_types do |t|
      t.references :organization, index: true
      t.string  :name
      t.string  :description
      t.string  :unit # KG, Bags, Volume, Stacks
      t.jsonb   :extra_fields, array: true, default: []
      t.timestamps null: false
    end
  end
end
