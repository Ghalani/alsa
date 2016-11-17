class DeleteUselessTables < ActiveRecord::Migration
  def up
    drop_table :farmer_id_cards
    drop_table :id_cards
    drop_table :farmer_certifications
    drop_table :certifications
    drop_table :categories_farmers
    drop_table :categories
    drop_table :villages
    drop_table :districts
  end
end
