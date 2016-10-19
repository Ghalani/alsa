class Farmer < ActiveRecord::Base
	has_many :farmer_certifications
	has_many :farmer_id_cards
	has_and_belongs_to_many :categories
	belongs_to :organization
	enum gender: [:male, :female]
end
