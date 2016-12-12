class CreateActivityTypes < ActiveRecord::Migration
  def change
    create_table :activity_types do |t|
      t.references  :organization, index: true
      t.string      :name
      t.string      :description
      t.timestamps null: false
    end
  end
end
