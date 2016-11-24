class OutgoingStockSerializer < ActiveModel::Serializer
  has_one :storage
  has_one :requester

  attributes :id, :quantity, :ordered_stock_id, :stored_stock_id, :organization_id, :stock_item
end