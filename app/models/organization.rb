class Organization < ActiveRecord::Base
	belongs_to :user
	has_many :memberships
	
end
