class WorkerType < ActiveRecord::Base
  acts_as_sane_tree
  belongs_to  :organization
  has_many    :children, foreign_key: "parent_id", class_name: "WorkerType", dependent: :destroy
  has_many    :workers, dependent: :nullify
end
