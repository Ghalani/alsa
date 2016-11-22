class Farm < ActiveRecord::Base
  belongs_to :organization
  belongs_to :farmer
  # belongs_to :village
  # belongs_to :district
end
