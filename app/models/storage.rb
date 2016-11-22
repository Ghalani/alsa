class Storage < ActiveRecord::Base
  before_save :downcase_fields
  belongs_to  :organization
  belongs_to  :storage_type
  belongs_to  :location
  has_many    :stored_stocks
  has_many    :outgoing_stocks

  validates :name, presence: true
  validates_uniqueness_of :name, scope: :organization_id

  def downcase_fields
    self.name.downcase!
  end
end
