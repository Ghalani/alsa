class CreateLabourers < ActiveRecord::Migration
  def change
    create_table :labourers do |t|
    	t.references  :organization, index: true
    	t.references  :village, index: true
      t.string  :fname
      t.string  :lname
      t.string  :phone
      t.integer :gender
      t.date		:dob

      t.timestamps null: false
    end
  end
end
