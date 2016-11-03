class Organization < ActiveRecord::Base
	after_initialize :set_admin_role, :if => :new_record?

	has_many		:districts
	has_many 		:memberships
	has_many 		:members, as: :users, through: :memberships, source: :user
	has_many 		:farmers
	has_many		:labourers
	belongs_to 	:user
	belongs_to	:country
	has_many		:farms
	has_many 		:roles

	def set_admin_role
		role = Role.create(organization_id: self.id, name: 'admin', permissions: {})
		self.roles << role
		current_user.roles << role
	end
end
