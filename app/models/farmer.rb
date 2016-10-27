class Farmer < ActiveRecord::Base
	has_many 		:farmer_certifications
	has_many 		:farmer_id_cards
	has_and_belongs_to_many :categories
	belongs_to 	:organization
  has_many 		:farms

	enum gender: [:male, :female]
	has_attached_file :image, styles: { large: "600X600#", medium: "300x300#", thumb: "100x100#" }, default_url: "/images/:style/farmer.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
