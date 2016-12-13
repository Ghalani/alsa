class TaskForm < ActiveRecord::Base
  belongs_to  :task
  has_many    :job_form_reports
end
