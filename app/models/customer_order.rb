class CustomerOrder < ActiveRecord::Base
  belongs_to  :organization
  belongs_to  :customer
  belongs_to  :deliverer, class_name: "User", foreign_key: 'deliverer_id'
  has_many    :ordered_stocks, dependent: :destroy

  enum status: [:pending, :active, :delivered]
  
  validates :customer_id, presence: true
  validates :date_ordered, presence: true
  before_save :validate_not_future_date
  validates :organization_id, presence: true

  private
    def validate_not_future_date
      begin
        raise unless (Time.parse(self.date_ordered) <= Time.now)
        true
      rescue
        errors.add("Datetime ordered", "must be less than current date and time." )
        false
      end
    end
end
