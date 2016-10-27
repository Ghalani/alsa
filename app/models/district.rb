class District < ActiveRecord::Base
	belongs_to 	:organization
	has_many 		:villages
	has_many 		:farms

end
