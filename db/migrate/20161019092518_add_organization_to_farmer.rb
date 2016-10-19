class AddOrganizationToFarmer < ActiveRecord::Migration
  def change
  	add_reference :farmers, :organization, index: true
  end
end
