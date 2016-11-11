class Location < ActiveRecord::Base
  acts_as_sane_tree
  has_many :children, foreign_key: "parent_id", class_name: "Location"
  belongs_to :location_type
  belongs_to :organization

  def Location.org_roots(org_id)
    roots.where(organization_id: org_id)
  end
end
