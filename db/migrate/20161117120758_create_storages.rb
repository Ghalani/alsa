class CreateStorages < ActiveRecord::Migration
  def change
    create_table :storages do |t|
      t.references  :organization, index: true
      t.references  :storage_type, index: true
      t.string      :name
      t.references  :location, index: true   
      t.decimal     :lat
      t.decimal     :lon
      t.timestamps null: false
    end
  end
end
