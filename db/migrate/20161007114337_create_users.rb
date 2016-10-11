class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, default: "", null: false
      t.string :username
      t.string :fname
      t.string :lname
      t.string :phone
      t.integer :role
      t.string :salt
      t.string :encrypted_password, default: "", null: false
      # t.string :status, default: "active"
      # t.string    :activation_digest
      # t.boolean   :activated
      # t.datetime  :activated_at
      t.string   "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"

      t.timestamps null: false
    end

    add_index "users", :email, name: "index_users_on_email", unique: true, using: :btree
    add_index "users", :phone, unique: true, using: :btree
    add_index "users", :reset_password_token, name: "index_users_on_reset_password_token", unique: true, using: :btree

  end
end
