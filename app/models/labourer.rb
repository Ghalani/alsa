class Labourer < ActiveRecord::Base
	belongs_to	:organization
	belongs_to	:village
end
