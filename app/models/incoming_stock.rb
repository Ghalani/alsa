class IncomingStock < ActiveRecord::Base
  has_many    :stored_stocks
  belongs_to  :organization 
  belongs_to  :stock_item 
  belongs_to  :stock_source
end
