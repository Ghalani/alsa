class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :fname, :lname, :phone, :email, :roles
end
