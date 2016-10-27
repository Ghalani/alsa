class CreateFarms < ActiveRecord::Migration
  def change
    create_table :farms do |t|
      t.references :farmer
      t.references :organization
      t.references :village
      t.string      :name
      t.decimal     :size
      t.jsonb       :points, array: true, default: []
      t.decimal     :lat
      t.decimal     :lon
      t.timestamps null: false
    end
  end
end
