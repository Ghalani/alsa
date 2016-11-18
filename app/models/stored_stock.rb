class StoredStock < ActiveRecord::Base
  belongs_to  :organization
  belongs_to  :storage
  belongs_to  :stock_item
  belongs_to  :incoming_stock
  has_many    :stored_stocks
end
