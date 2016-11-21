class AddQuantityTakenToStoredStock < ActiveRecord::Migration
  def change
    add_column :stored_stocks, :quantity_taken, :integer, default: 0
  end
end
