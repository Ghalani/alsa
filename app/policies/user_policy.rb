class UserPolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
  	@current_user.app_role == "company"
  end

  def show?
    # (current_user.organizations(where user is a member) @current_user.app_role == "company")
  	(@current_user.app_role == "company") or @current_user == @user
  end

  def update?
  	@current_user == @user
  end

  def destroy?
    false
  	#(@current_user != @user) && @current_user.admin?
  end
end