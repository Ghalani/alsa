class Currency < ActiveRecord::Base
  has_many :countries
  validates :name, presence: true, uniqueness: true
  validates :iso_code, presence: true, uniqueness: true
  validates :symbol, presence: true
end
