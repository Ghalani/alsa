# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Currency.create([
  {
    name: "United States Dollar",
    iso_code: "USD",
    iso_numeric: "840",
    symbol: "$",
    subunit: "cent"
  },
  {
    name: "Ghanaian cedi",
    iso_code: "GHC",
    iso_numeric: "288",
    symbol: "GH₵",
    subunit: "Pesewa"
  },
  {
    name: "Nigerian naira",
    iso_code: "NGN",
    iso_numeric: "566",
    symbol: "₦",
    subunit: "Kobo"
  },
  {
    name: "Kenyan shilling",
    iso_code: "KES",
    iso_numeric: "404",
    symbol: "Ksh",
    subunit: "Cent"
  },
])