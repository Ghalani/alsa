class UserSerializer < ActiveModel::Serializer
  attributes :id, :fname, :lname, :phone, :email
end
