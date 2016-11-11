class LocationTypeSerializer < ActiveModel::Serializer
  has_many :children
  attributes :id, :name
end
