class ChangeLatLngToFloat < ActiveRecord::Migration
  def change
    change_column :districts, :lat, :float
    change_column :districts, :lng, :float
    change_column :villages,  :lat, :float
    change_column :villages,  :lng, :float
    change_column :farms,     :lat, :float
    change_column :farms,     :lng, :float
  end
end
