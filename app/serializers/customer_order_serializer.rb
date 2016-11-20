class CustomerOrderSerializer < ActiveModel::Serializer
  has_one :customer
  has_one :deliverer
  has_many :ordered_stocks

  attributes :id, :status, :date_ordered, :date_delivered
end