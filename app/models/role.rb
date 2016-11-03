class Role < ActiveRecord::Base
  belongs_to :organization
  has_and_belongs_to_many :users

  validates_uniqueness_of :name, scope: :organization_id
end
