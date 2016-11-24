class StoredStock < ActiveRecord::Base
  belongs_to  :organization
  belongs_to  :storage
  belongs_to  :stock_item
  belongs_to  :incoming_stock
  has_many    :stored_stocks
  has_many    :outgoing_stocks

  def remaining
    self.quantity - self.quantity_requested
  end

  def quantity_requested
    self.outgoing_stocks.inject(0){|sum, outgoing_stock| sum + outgoing_stock.quantity }
  end

  def save_and_update_icoming_quantity_stored
    transaction do
      incoming_remaining = self.incoming_stock.remaining
      begin
        if incoming_remaining >= self.quantity
          save!
        else
          raise ActiveRecord::Rollback        
        end
        true
      rescue
        errors.add(:quantity, :blank, message: "is greater than what's in stock (#{incoming_remaining})")
        false
      end
    end
  end
end
