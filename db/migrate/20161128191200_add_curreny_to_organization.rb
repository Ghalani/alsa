class AddCurrenyToOrganization < ActiveRecord::Migration
  def change
    add_reference :organizations, :currency
  end
end
