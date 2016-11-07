class RolePolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
    @current_user = current_user
    @role = model
  end

  def index?
    @current_user.admin?
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
    role = @current_user.org_role(@role.organization)
    if (role)
      if (role.name == 'admin')
        return true
      else
        role.permissions['organizations'][block.call]
        #role.permissions['organizations'].include?(block.call)
        #block.call
      end
    else 
      return false
    end
  end
end