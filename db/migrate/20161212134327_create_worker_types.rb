class CreateWorkerTypes < ActiveRecord::Migration
  def change
    create_table :worker_types do |t|
      t.references  :organization, index: true
      t.integer     :parent_id
      t.string      :name

      t.timestamps null: false
    end
  end
end
