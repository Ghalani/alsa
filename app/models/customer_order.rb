class CustomerOrder < ActiveRecord::Base
  belongs_to  :organization
  belongs_to  :customer
  belongs_to  :deliverer, class_name: "User", foreign_key: 'deliverer_id'
  has_many    :ordered_stocks, dependent: :destroy

  enum status: [:pending, :active, :delivered]
end
