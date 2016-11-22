class StorageSerializer < ActiveModel::Serializer
  has_one :storage_type
  has_one :location

  attributes :id, :name, :location_id, :organization_id
end