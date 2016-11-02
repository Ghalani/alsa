class RemoveRoleAndAddRoleModelFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :role

    create_table :roles_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :role, index: true
    end
  end
end
