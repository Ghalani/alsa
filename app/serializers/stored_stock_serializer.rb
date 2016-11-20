class StoredStockSerializer < ActiveModel::Serializer
  has_one :organization
  has_one :stock_item
  has_one :storage
  has_one :incoming_stock

  attributes :id, :quantity
end