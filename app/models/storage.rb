class Storage < ActiveRecord::Base
  belongs_to  :organization
  belongs_to  :storage_type
  has_many    :stored_stocks
  has_many    :outgoing_stocks
end
