class StockItem < ActiveRecord::Base
  belongs_to  :organization
  belongs_to  :stock_type
  has_many  :stored_stocks
  has_many  :ordered_stocks
  has_many  :outgoing_stocks
  has_many  :incoming_stocks

  validates :name, presence: true
  validates :organization_id, presence: true
  validates :stock_type_id, presence: true
  validates_uniqueness_of :name, scope: :organization_id

end
