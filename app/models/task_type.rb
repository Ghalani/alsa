class TaskType < ActiveRecord::Base
  belongs_to  :organization
  has_many    :tasks
end
