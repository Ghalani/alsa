class JobRating < ActiveRecord::Base
  belongs_to  :organization
  belongs_to  :job
  belongs_to  :worker
  belongs_to  :job_report
  has_many    :jobs
end
