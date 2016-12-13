class CreateTaskForms < ActiveRecord::Migration
  def change
    create_table :task_forms do |t|
      t.references  :organization, index: true
      t.references  :task, index: true
      t.string      :name
      t.jsonb       :fields
      t.timestamps null: false
    end
  end
end
