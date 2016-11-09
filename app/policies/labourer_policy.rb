class LabourerPolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
    @current_user = current_user
    @labouer = model
  end

  def index?
    verify {"index"}
  end

  def new?
    verify {"new"}
  end

  def create?
    verify {"create"}
  end

  def edit?
    verify {"edit"}

  end

  def show?
  	verify {"show"}
  end

  def update?
    verify {"update"}
  end

  def destroy?
    verify {"destroy"}
  end

  def verify(&block)
    if (@current_user.app_role == "company")
      return true
    end
    
    role = @current_user.org_role(@labourer.organization)
    if (role)
      role.permissions &&
      role.permissions > 0 && 
      role.permissions['labourers'] && 
      role.permissions['labourers'][(block.call)]
    else 
      return false
    end
  end
end