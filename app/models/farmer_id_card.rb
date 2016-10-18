class FarmerIdCard < ActiveRecord::Base
	belongs_to	:farmer
	belongs_to	:id_card
end
