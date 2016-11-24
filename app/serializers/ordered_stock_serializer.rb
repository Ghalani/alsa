class OrderedStockSerializer < ActiveModel::Serializer
  has_one :stock_item
  has_one :receiver
  has_many :outgoing_stocks

  attributes :id, :stock_item_id, :customer_order_id, :quantity, :quantity_requested, :cost
end