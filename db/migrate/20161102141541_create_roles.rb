class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.references  :organization
      t.string      :name
      t.jsonb       :permissions
      t.timestamps null: false
    end
  end
end
