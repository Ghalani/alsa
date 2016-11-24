class OrderedStock < ActiveRecord::Base
  belongs_to  :organization
  belongs_to  :stock_item 
  belongs_to  :customer_order
  has_many    :outgoing_stocks
  belongs_to  :receiver, class_name: "User", foreign_key: 'receiver_id'

  def quantity_requested
    self.outgoing_stocks.inject(0){|sum, outgoing_stock| sum + outgoing_stock.quantity }
  end

  def as_json(options = {})
    super(options.merge({ except: [:updated_at, :created_at], include: [:stock_item, :outgoing_stocks] }))
  end
end
