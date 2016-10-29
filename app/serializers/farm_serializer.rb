class FarmSerializer < ActiveModel::Serializer
  has_one     :organization
  attributes  :id, :name, :size, :lat, :lng, :points
end
