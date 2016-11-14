class Location < ActiveRecord::Base
  acts_as_sane_tree
  has_many   :children, foreign_key: "parent_id", class_name: "Location", dependent: :destroy
  belongs_to :location_type
  belongs_to :organization
  
  validates :name, presence: true
  validates :organization_id, presence: true
  validates :location_type_id, presence: true
  validates_uniqueness_of :name, scope: [:organization_id, :location_type_id]


  def Location.org_roots(org_id)
    roots.where(organization_id: org_id)
  end
end
