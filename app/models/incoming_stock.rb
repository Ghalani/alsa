class IncomingStock < ActiveRecord::Base
  has_many    :stored_stocks
  belongs_to  :organization 
  belongs_to  :stock_item 
  belongs_to  :stock_source
  belongs_to  :receiver, class_name: "User", foreign_key: 'receiver_id'

  validates :organization_id, presence: true
  validates :stock_item_id, presence: true

  def quantity_stored
    out = 0;
    self.stored_stocks.each do |ss|
      out += ss.quantity
    end
    return out
  end

  def remaining
    self.quantity - self.quantity_stored
  end
end
