class Task < ActiveRecord::Base
  belongs_to  :organization
  belongs_to  :task_type
  has_many    :jobs
  has_many    :task_forms
end
