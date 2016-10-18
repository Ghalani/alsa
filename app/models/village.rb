class Village < ActiveRecord::Base
	belongs_to	:district
	has_many		:farmers
end
