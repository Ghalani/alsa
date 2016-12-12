class CreateJobFormReports < ActiveRecord::Migration
  def change
    create_table :job_form_reports do |t|

      t.timestamps null: false
    end
  end
end
