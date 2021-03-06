class Organization < ActiveRecord::Base
	#after_initialize :set_admin_role, :if => :new_record?
	before_save :downcase_fields
	belongs_to 	:user
	belongs_to	:country
	belongs_to	:currency

	has_many		:districts
	has_many 		:memberships
	has_many 		:members, as: :users, through: :memberships, source: :user
	has_many 		:farmers
	has_many		:labourers
	has_many		:farms
	has_many 		:roles
	has_many 		:location_types
	has_many 		:locations

	has_many		:customers
	has_many		:stock_sources
	has_many		:stock_types
	has_many		:stock_items
	has_many		:incoming_stocks
	has_many		:storage_types
	has_many		:storages
	has_many		:stored_stocks
	has_many		:customer_orders
	has_many		:ordered_stocks
	has_many		:outgoing_stocks

	validates :user_id, presence: true
	validates :country_id, presence: true
	validates_uniqueness_of :name, scope: :user_id

	# def set_admin_role
	# 	role = Role.create(organization_id: self.id, name: 'admin', permissions: {})
	# 	self.roles << role
	# 	current_user.roles << role
	# end

	has_attached_file :image, styles: { large: "600X600#", medium: "300x300#", thumb: "100x100#" }, default_url: "/images/:style/organization.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	def image_url
    url = Hash.new
    url[:thumb] = image.url(:thumb)
    url[:medium] = image.url(:medium)
    url[:large] = image.url(:large)
    url
  end

	def users
	 self.members
	end

	def as_json(options = {})
    super(options.merge({ except: [:updated_at, :created_at] }))
  end
	
	private
		def downcase_fields
			self.name.downcase!
		end
end
