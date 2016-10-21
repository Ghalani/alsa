class Organization < ActiveRecord::Base
	has_many		:districts
	has_many 		:memberships
	has_many 		:members, as: :users, through: :memberships, source: :user
	has_many 		:farmers
	has_many		:labourers
	belongs_to 	:user
	belongs_to	:country
	
end
