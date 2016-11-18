class CustomerOrder < ActiveRecord::Base
  belongs_to :organization
  belongs_to :customer

  enum status: [:pending, :active, :delivered]
end
