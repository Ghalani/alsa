class Customer < ActiveRecord::Base
  has_many :customer_orders
  belongs_to :organization

  validates :name, presence: true
  validates :organization_id, presence: true

  validates_uniqueness_of :name, scope: :organization_id
  validates_uniqueness_of :email, scope: :organization_id, allow_blank: true
  validates_uniqueness_of :phone, scope: :organization_id, allow_blank: true
end
