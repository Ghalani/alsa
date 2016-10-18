class OrganizationPolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
    @current_user = current_user
    @org = model
  end

  def index?
    #@current_user.admin?
  end

  def new?
    @current_user.admin?
  end

  def create?
    @current_user.admin?
  end

  def show?
  	@current_user.admin? or (Membership.where(user: @current_user, organization: @org).size > 0)
  end

  def update?
  	@current_user.admin?
  end

  def destroy?
  	(@org.memberships.size < 1) && @current_user.admin?
  end
end