class CreateJobRatings < ActiveRecord::Migration
  def change
    create_table :job_ratings do |t|

      t.timestamps null: false
    end
  end
end
