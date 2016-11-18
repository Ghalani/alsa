class CreateCustomerOrders < ActiveRecord::Migration
  def change
    create_table :customer_orders do |t|
      t.references  :organization, index: true
      t.references  :customer, index: true
      t.integer     :status
      t.datetime    :date_ordered
      t.belongs_to  :deliverer_id, class_name: "User"
      t.datetime    :date_delivered

      t.timestamps null: false
    end
  end
end
