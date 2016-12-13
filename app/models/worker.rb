class Worker < ActiveRecord::Base
  belongs_to  :organization
  belongs_to  :worker_type
  has_many    :jobs
  has_many    :job_reports, dependent: :destroy
  has_many    :job_ratings, dependent: :destroy
  has_and_belongs_to_many :assignments, join_table: "jobs_workers", foreign_key: "worker_id"

end
