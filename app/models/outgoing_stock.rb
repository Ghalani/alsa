class OutgoingStock < ActiveRecord::Base
  belongs_to  :organization
  belongs_to  :stock_item 
  belongs_to  :storage 
  belongs_to  :ordered_stock
  belongs_to  :stored_stock
  belongs_to  :requester, class_name: "User", foreign_key: 'requester_id'


  def save_and_update_quantity_taken
    transaction do
      remaining = self.stored_stock.remaining
      begin
        if remaining >= self.quantity
          customer_order = self.ordered_stock.customer_order
          raise StandardError, "total request order is more than ordered quantity" unless is_enough?
          customer_order.active! if customer_order.pending?
          save!
          #self.stored_stock.quantity_taken += self.quantity
        else
          raise ActiveRecord::Rollback, "is greater than what's in stock (#{remaining})"        
        end
        true
      rescue Exception => e
        errors.add(:quantity, :blank, message: e.message)
        false
      end
    end
  end

  def is_enough?
    (self.ordered_stock.quantity_requested + self.quantity <= self.ordered_stock.quantity)
  end
end
