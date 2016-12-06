class Role < ActiveRecord::Base
  belongs_to :organization
  has_and_belongs_to_many :users, dependent: :destroy #dependent: :nullify

  validates :name, presence: true
  validates_uniqueness_of :name, scope: :organization_id
end
