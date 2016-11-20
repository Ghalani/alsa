class IncomingStockSerializer < ActiveModel::Serializer
  has_one :organization
  has_one :stock_item
  has_one :stock_source
  has_one :receiver
  has_many :stored_stocks

  attributes :id, :quantity, :arrived_at, :quantity_stored
end