class District < ActiveRecord::Base
	belongs_to 	:organization
	has_many 		:villages
end
