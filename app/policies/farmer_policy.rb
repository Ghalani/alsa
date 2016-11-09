class FarmerPolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
    @current_user = current_user
    @farmer = model
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
    
    role = @current_user.org_role(@farmer.organization)
    if (role)
      # if user is allowed to CREATE, he should be allowed to goto NEW, and UPDATE
      method = ((block.call == "new") || (block.call == "update")) ? blobck.call : "create"
      role.permissions &&
      role.permissions > 0 && 
      role.permissions['farmers'] && 
      role.permissions['farmers'][method]
    else 
      return false
    end
  end
end