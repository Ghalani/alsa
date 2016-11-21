class OutgoingStock < ActiveRecord::Base
  belongs_to  :organization
  belongs_to  :stock_item 
  belongs_to  :storage 
  belongs_to  :ordered_stock

  def save_and_update_quantity_taken
    transaction do
      begin
        if self.stored_stock.remaining >= self.quantity
          save!
          self.stored_stock.remaining += self.quantity
        else
          raise ActiveRecord::Rollback        
        end
        true
      rescue
        false
      end
    end
  end
end
