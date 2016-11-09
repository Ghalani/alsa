class AddAppRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :app_role, :integer, default: 1
  end
end
