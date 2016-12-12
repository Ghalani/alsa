class CreateWorkerTypes < ActiveRecord::Migration
  def change
    create_table :worker_types do |t|
      t.references  :organization, index: true
      t.references  :worker_type # parent
      t.string     :name

      t.timestamps null: false
    end
  end
end
