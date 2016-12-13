class CreateJobsWorkersJoinTable < ActiveRecord::Migration
  def change
    create_table :jobs_workers, id: false do |t|
      t.belongs_to :job, index: true
      t.belongs_to :worker, index: true
    end
  end
end
