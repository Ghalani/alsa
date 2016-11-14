class LocationTypeSerializer < ActiveModel::Serializer
  has_many :children
  attributes :id, :name, :parent, :parent_id, :children
end
