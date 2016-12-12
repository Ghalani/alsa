class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references  :organization, index: true
      t.references  :activity, index: true
      t.references  :location, index: true
      t.integer     :recepient, default: 0
      t.integer     :recepient_id
      t.integer     :frequency, default: 0
      t.datetime    :start_date
      t.datetime    :end_date
      t.attachment  :image
      t.integer     :status, default: 0
      t.text        :description
      t.integer     :cost_per_worker, default: 0
      t.integer     :leader_cost, default: 0
      t.integer     :max_worker, default: 0
      t.timestamps null: false      
    end
  end
end
