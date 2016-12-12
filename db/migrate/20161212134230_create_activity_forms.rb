class CreateActivityForms < ActiveRecord::Migration
  def change
    create_table :activity_forms do |t|

      t.timestamps null: false
    end
  end
end
