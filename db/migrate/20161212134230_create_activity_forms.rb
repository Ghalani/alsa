class CreateActivityForms < ActiveRecord::Migration
  def change
    create_table :activity_forms do |t|
      t.references  :organization, index: true
      t.references  :activity, index: true
      t.string      :name
      t.jsonb       :fields
      t.timestamps null: false
    end
  end
end
