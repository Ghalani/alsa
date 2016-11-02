class User < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
	#attr_accessor :activation_token
  before_save   :encrypt_password, :if => proc{ |u| !u.password.blank? }
  before_save   :downcase_fields
  # after_initialize :set_default_role, :if => :new_record?
  
  # before_create :create_activation_digest
  # before_save   :reset_activation_digest
  # after_save :clear_password

  has_attached_file :image, styles: { large: "600X600#", medium: "300x300#", thumb: "100x100#" }, default_url: '/images/:style/user.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :organizations
  has_many :memberships
  has_many :member_organizations, as: :organizations, through: :memberships, source: :organization

  has_and_belongs_to_many :roles

  # enum role: [:user, :team_leader, :area_planner, 
  #             :labour_coodinator, :technical_coordinator, :planning, 
  #             :operations, :program_manager, :admin]
              

  validates :email, presence: true, uniqueness: true
  # validates :encrypted_password, presence: true, allow_blank: false

  # def set_default_role
  #   self.role ||= :user
  # end

  def org_role( org )
    self.role.where(organization_id: org.id)
  end

  def name
    "#{self.fname} #{self.lname}"
  end

  def encrypt_password
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
  end

  def authenticate(password)
    self.encrypted_password == BCrypt::Engine.hash_secret(password, self.salt)
    #return true
  end

  def get_member_orgs
    org = (Organization.where(user_id: self.id) + 
                Membership.where(user_id: self.id).collect{ |mem|
                  mem.organization
                }).flatten.uniq
  end

  def is_member?(org)
    self.member_organizations.include? org
  end
  # -------------

  # def authenticated?(attribute, token)
  #   digest = send("#{attribute}_digest")
  #   return false if digest.nil?
  #   BCrypt::Password.new(digest).is_password?(token)
  # end

  # # Returns the hash digest of the given string.
  # def User.digest(string)
  #   cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
  #                                                 BCrypt::Engine.cost
  #   BCrypt::Password.create(string, cost: cost)
  # end

  # # Returns a random token.
  # def User.new_token
  #   SecureRandom.urlsafe_base64
  # end

  #----------------


  private
  def downcase_fields
    #self.fname.downcase!
    #self.lname.downcase!
    self.email.downcase!
  end
end
