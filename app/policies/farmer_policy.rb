class FarmerPolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
    @current_user = current_user
    @farmer = model
  end

  def index?
    @current_user or @current_user.is_member?(@farmer.organization)
  end

  def new?
    @current_user.admin?
  end

  def create?
    @current_user.admin?
  end

  def show?
  	@current_user.admin? or @current_user.is_member?(@farmer.organization)
  end

  def update?
  	@current_user.admin?
  end

  def destroy?
  	@current_user.admin?
  end
end