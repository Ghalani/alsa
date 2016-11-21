class StoredStock < ActiveRecord::Base
  belongs_to  :organization
  belongs_to  :storage
  belongs_to  :stock_item
  belongs_to  :incoming_stock
  has_many    :stored_stocks

  def remaining
    self.quantity - self.quantity_taken
  end

  def save_and_update_icoming_quantity_stored
    transaction do
      begin
        if self.incoming_stock.remaining >= self.quantity
          save!
        else
          self.errors.add("cannot be nil") 
          raise ActiveRecord::Rollback        
        end
        true
      rescue
        false
      end
    end
  end
end
