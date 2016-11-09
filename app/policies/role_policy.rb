class RolePolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
    @current_user = current_user
    @role = model
  end

  def index?
    verify {}
  end

  def new?
  	verify {}
  end

  def create?
  	verify {}
  end

  def show?
    verify{ "show" }
  end

  def update?
  	verify { "update" }
  end

  def destroy?
    verify {  } 
  end

  def verify(&block)
    if @current_user.app_role == "company"
      return true
    end
    
    role = @current_user.org_role(@role.organization) if @role
    if (role)
      role.permissions > 0 && 
      role.permissions['roles'][block.call]
    else 
      return false
    end
  end
end