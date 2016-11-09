class Organization < ActiveRecord::Base
	#after_initialize :set_admin_role, :if => :new_record?
	before_save :downcase_fields

	has_many		:districts
	has_many 		:memberships
	has_many 		:members, as: :users, through: :memberships, source: :user
	has_many 		:farmers
	has_many		:labourers
	belongs_to 	:user
	belongs_to	:country
	has_many		:farms
	has_many 		:roles

	validates :user_id, presence: true
	validates :country_id, presence: true
	validates_uniqueness_of :name, scope: :user_id

	# def set_admin_role
	# 	role = Role.create(organization_id: self.id, name: 'admin', permissions: {})
	# 	self.roles << role
	# 	current_user.roles << role
	# end

	def users
	 self.members
	end

	private
		def downcase_fields
			self.name.downcase!
		end
end
