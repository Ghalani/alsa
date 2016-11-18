class StockType < ActiveRecord::Base
  belongs_to  :organization
  has_many    :stock_items

  validates :name, presence: true
  validates :unit, presence: true
  validates_uniqueness_of :name, scope: :organization_id
end
