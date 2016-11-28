class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :iso_code
      t.string :iso_numeric
      t.string :symbol    # $
      t.string :subunit   # kobo, cent, cedi
      t.string :seperator, default: "." # 100.34 or 100:34
      t.string :delimeter, default: "," # 100,000
      t.timestamps null: false
    end
  end
end
