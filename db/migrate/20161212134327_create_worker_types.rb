class CreateWorkerTypes < ActiveRecord::Migration
  def change
    create_table :worker_types do |t|

      t.timestamps null: false
    end
  end
end
