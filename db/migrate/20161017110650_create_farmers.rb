class CreateFarmers < ActiveRecord::Migration
  def change
    create_table :farmers do |t|
    	t.string 	:fname
    	t.string 	:lname
    	t.string 	:phone
    	t.integer :gender
    	t.date 		:dob
    	t.integer :educational_level
    	t.references :village
    	t.boolean :caa_id
    	t.string 	:kcl_district_id
    	t.boolean :certified
    	t.integer	:marital_status
    	t.integer	:num_of_sharecroppers

      t.timestamps null: false
    end
  end
end
