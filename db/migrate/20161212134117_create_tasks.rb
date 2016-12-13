class CreateTasks < ActiveRecord::Migration
  def up
    create_table :tasks do |t|
      t.references  :organization, index: true
      t.references  :task_type, index: true
      t.string      :name
      t.string      :description
      t.attachment  :image
      t.timestamps null: false
    end
  end

  def down
    remove_attachment :tasks, :image
    drop_table :tasks
  end
end
