class AddCountryToOrganizations < ActiveRecord::Migration
  def change
  	add_reference :organizations, :country, index: true
  end
end
