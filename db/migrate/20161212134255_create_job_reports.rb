class CreateJobReports < ActiveRecord::Migration
  def change
    create_table :job_reports do |t|

      t.timestamps null: false
    end
  end
end
