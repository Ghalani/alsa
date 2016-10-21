class LabourerPolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
    @current_user = current_user
    @labouer = model
  end

  def index?
    @current_user or @current_user.is_member?(@labouer.organization)
  end

  def new?
    @current_user.admin?
  end

  def create?
    @current_user.admin?
  end

  def show?
  	@current_user.admin? or @current_user.is_member?(@labouer.organization)
  end

  def update?
  	@current_user.admin?
  end

  def destroy?
  	@current_user.admin?
  end
end