class Farmer < ActiveRecord::Base
	has_and_belongs_to_many :categories
	has_many :farmer_certifications
	has_many :farmer_id_cards
end
