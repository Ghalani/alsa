class CreateLocationTypes < ActiveRecord::Migration
  def change
    create_table :location_types do |t|
      t.string      :name
      t.references  :organization
      t.references  :location_type
      t.jsonb       :points, array: true, default: []
      t.decimal     :lat
      t.decimal     :lon
      t.timestamps null: false
    end
  end
end
