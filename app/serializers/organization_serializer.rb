class OrganizationSerializer < ActiveModel::Serializer
  has_one     :country
  attributes  :id, :name, :bio
end
