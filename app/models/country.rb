class Country < ActiveRecord::Base
	has_many :organizations
	
  def as_json(options = {})
    super(options.merge({ except: [:updated_at, :created_at] }))
  end
end
