class LocationType < ActiveRecord::Base
  acts_as_sane_tree
  has_many :children, foreign_key: "parent_id", class_name: "LocationType", dependent: :destroy
  has_many :locations, dependent: :destroy
  belongs_to :location_types
  belongs_to :organization

  validates :name, presence: true
  validates :organization_id, presence: true
  validates_uniqueness_of :name, scope: [:organization_id]

  def LocationType.org_roots(org_id)
    roots.where(organization_id: org_id)
    # LocationType.roots.map { |r| r.organization_id == org_id }
  end
end
