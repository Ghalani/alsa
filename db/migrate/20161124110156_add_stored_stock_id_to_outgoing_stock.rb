class AddStoredStockIdToOutgoingStock < ActiveRecord::Migration
  def change
    add_reference :outgoing_stocks, :stored_stock, index: true
  end
end
