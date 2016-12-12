class CreateActivities < ActiveRecord::Migration
  def up
    create_table :activities do |t|
      t.references  :organization, index: true
      t.references  :activity_type, index: true
      t.string      :name
      t.string      :description
      t.attachment  :image
      t.timestamps null: false
    end
  end

  def down
    remove_attachment :activities, :image
    drop_table :activities
  end
end
