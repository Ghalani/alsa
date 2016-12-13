class CreateJobRatings < ActiveRecord::Migration
  def change
    create_table :job_ratings do |t|
      t.references  :organization, index: true
      t.references  :job, index: true
      t.references  :worker, index: true
      t.references  :job_report, index: true
      t.string      :remark
      t.integer     :value # range e.g. [0, 0.25, 0.5, 0.75, 1]

      t.timestamps null: false
    end
  end
end