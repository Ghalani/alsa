class AddAttachmentImageToStockItem < ActiveRecord::Migration
  def self.up
    change_table :stock_items do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :stock_items, :image
  end
end
