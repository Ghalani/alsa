class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.references :organization, index: true
      t.string  :name
      t.string  :email
      t.string  :phone
      t.string  :address
      t.timestamps null: false
    end
  end
end
