class AddDefaultDatetimeToCustomerOrder < ActiveRecord::Migration
  def change
    change_column_default :customer_orders, :date_ordered, DateTime.now
  end
end
