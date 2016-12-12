class CreateJobReports < ActiveRecord::Migration
  def change
    create_table :job_reports do |t|      
      t.references  :organization, index: true
      t.references  :job, index: true
      t.references  :worker, index: true
      t.integer     :remark
      t.datetime    :datetime
      t.integer     :status, default: 0 #[pending, approved, rejected]
      t.timestamps null: false
    end
  end
end
