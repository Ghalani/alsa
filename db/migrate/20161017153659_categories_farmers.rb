class CategoriesFarmers < ActiveRecord::Migration
  def change
  	create_table :categories_farmers, id: false do |t|
  		t.references	:category
    	t.references	:farmer
  	end
  end
end
