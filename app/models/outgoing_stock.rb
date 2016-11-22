class OutgoingStock < ActiveRecord::Base
  belongs_to  :organization
  belongs_to  :stock_item 
  belongs_to  :storage 
  belongs_to  :ordered_stock

  def save_and_update_quantity_taken
    transaction do
      remaining = self.stored_stock.remaining
      begin
        if remaining >= self.quantity
          save!
          self.stored_stock.remaining += self.quantity
        else
          raise ActiveRecord::Rollback        
        end
        true
      rescue
        errors.add(:quantity, :blank, message: "is greater than what's in the stored-stock (#{remaining})")
        false
      end
    end
  end
end
