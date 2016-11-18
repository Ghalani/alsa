class CreateStorageTypes < ActiveRecord::Migration
  def change
    create_table :storage_types do |t|
      t.references :organization, index: true
      t.string  :name
      t.string  :description
      t.timestamps null: false
    end
  end
end
