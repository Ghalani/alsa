class CreateWorkers < ActiveRecord::Migration
  def up
    create_table :workers do |t|
      t.references  :organization, index: true
      t.references  :worker_type
      t.string      :fname
      t.string      :lname
      t.string      :phone
      t.string      :salt
      t.string      :encrypted_pin
      t.string      :access_token
      t.attachment  :image

      t.timestamps null: false
    end
  end

  def down
    remove_attachment :workers, :image
    drop_table  :workers
  end
end
