class ChangeCoordsToDecimal < ActiveRecord::Migration
  def up
    change_column :villages,   :lat, :decimal
    change_column :villages,   :lon, :decimal
    change_column :districts,  :lat, :decimal
    change_column :districts,  :lon, :decimal
  end
end
