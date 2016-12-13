class Job < ActiveRecord::Base
  belongs_to  :organization
  belongs_to  :task
  belongs_to  :location
  belongs_to  :worker
  has_many    :job_reports
  has_many    :job_ratings
  has_and_belongs_to_many :workers #, join_table: "table_name", foreign_key: "worker_id"

end
