class DeleteLocationAndLocationTypeAndRedefine < ActiveRecord::Migration
  def change
    drop_table :locations
    drop_table :location_types

    create_table  :locations do |t|
      t.references  :organization
      t.string      :name
      t.integer     :parent_id
      t.references  :location_type
      t.jsonb       :points, array: true, default: []
      t.decimal     :lat
      t.decimal     :lon
      t.timestamps null: false
    end

    create_table :location_types do |t|
      t.references    :organization
      t.string        :name
      t.integer       :parent_id
      t.timestamps null: false
    end
  end
end
