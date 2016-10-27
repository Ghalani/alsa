class AddAttachmentImageToLabourers < ActiveRecord::Migration
  def self.up
    change_table :labourers do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :labourers, :image
  end
end
