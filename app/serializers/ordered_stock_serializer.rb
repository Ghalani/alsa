class OrderedStockSerializer < ActiveModel::Serializer
  has_one :stock_item
  has_one :receiver

  attributes :id, :customer_order_id, :quantity, :cost
end