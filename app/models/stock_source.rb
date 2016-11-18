class StockSource < ActiveRecord::Base
  belongs_to  :organization
  has_many    :incoming_stocks

  validates :name, presence: true
  validates :organization_id, presence: true
  validates_uniqueness_of :name, scope: :organization_id
end
