class CreateJobFormReports < ActiveRecord::Migration
  def change
    create_table :job_form_reports do |t|
      t.references  :organization, index: true
      t.references  :job, index: true
      t.references  :worker, index: true
      t.references  :activity_form, index: true
      t.jsonb       :report
      t.datetime    :datetime

      t.timestamps null: false
    end
  end
end
