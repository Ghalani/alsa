class Farm < ActiveRecord::Base
  belongs_to :organization
  belongs_to :village
  belongs_to :district
end
