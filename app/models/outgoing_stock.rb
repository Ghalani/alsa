class OutgoingStock < ActiveRecord::Base
  belongs_to  :organization
  belongs_to  :stock_item 
  belongs_to  :storage 
  belongs_to  :ordered_stock
end
