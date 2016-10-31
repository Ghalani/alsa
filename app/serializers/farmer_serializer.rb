class FarmerSerializer < ActiveModel::Serializer
  has_one     :organization
  attributes  :id, :fname, :lname, :gender, :phone, :image_url
end
