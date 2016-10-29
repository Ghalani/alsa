class ChangeLonToLng < ActiveRecord::Migration
  def change
    rename_column :districts, :lon, :lng
    rename_column :villages,  :lon, :lng
    rename_column :farms,     :lon, :lng
  end
end
