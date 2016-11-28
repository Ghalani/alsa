class StockItemSerializer < ActiveModel::Serializer
  #has_one :organization
  has_one :stock_type

  attributes :id, :stock_type_id, :name, :cost, :minimum_quantity, :extra
end