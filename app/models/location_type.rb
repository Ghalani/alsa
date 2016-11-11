class LocationType < ActiveRecord::Base
  acts_as_sane_tree
  has_many :children, foreign_key: "parent_id", class_name: "LocationType"
  belongs_to :location_types

  def LocationType.org_root(org_id)
    roots.where(organization_id: org_id)
    # LocationType.roots.map { |r| r.organization_id == org_id }
  end
end
