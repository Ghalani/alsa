class OrderedStock < ActiveRecord::Base
  belongs_to  :organization
  belongs_to  :stock_item 
  belongs_to  :customer_order
  has_many    :outgoing_stocks
end
