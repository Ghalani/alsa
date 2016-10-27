class Village < ActiveRecord::Base
	belongs_to	:district
	has_many		:farmers
	has_many		:labourers
	has_many 		:farms
end