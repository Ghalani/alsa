class StorageType < ActiveRecord::Base
  belongs_to  :organization
  has_many    :storages
end
