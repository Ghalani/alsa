class JobFormReport < ActiveRecord::Base
  belongs_to  :organization
  belongs_to  :job
  belongs_to  :task_form
end
