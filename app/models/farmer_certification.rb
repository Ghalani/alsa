class FarmerCertification < ActiveRecord::Base
	belongs_to	:farmer
	belongs_to	:certification
end
