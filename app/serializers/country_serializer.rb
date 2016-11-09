class CountrySerializer < ActiveModel::Serializer
  attributes :id, :name, :nicename, :iso, :iso3
end
