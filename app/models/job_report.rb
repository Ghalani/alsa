class JobReport < ActiveRecord::Base
  belongs_to  :organization
  belongs_to  :job
  belongs_to  :worker
  has_many    :job_ratings
  has_many    :job_form_reports

end
