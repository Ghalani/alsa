class FarmerPolicy
	attr_reader :current_user, :model  
  before_filter :set_organization, except: [:index?]


	def initialize(current_user, model)
    @current_user = current_user
    @farmer = model
  end

  def index?
    # verify {"index"}
    @organization = @farmer
    (@organization.user == @current_user) || @current_user.is_member?(@organization)
  end

  def new?
    verify {"create"}
  end

  def create?
    verify {"create"}
  end

  def edit?
    verify {"create"}
  end

  def show?
  	verify {"create"}
  end

  def update?
    verify {"create"}
  end

  def destroy?
    verify {"destroy"}
  end

  def verify(&block)
    # if (@current_user.app_role == "company")
    #   return true
    # end
    return true if @organization.user == @current_user
      
    role = @current_user.org_role(@organization)
    begin
      return true if role.permissions['farmers'][block.call]      
    rescue
      false
    end
    # if (role)
    #   # if user is allowed to CREATE, he should be allowed to goto NEW, and UPDATE
    #   # method = ((block.call == "new") || (block.call == "update")) ? blobck.call : "create"
    #   role.permissions &&
    #   role.permissions > 0 && 
    #   role.permissions['farmers'] && 
    #   role.permissions['farmers'][method]
    # else 
    #   return false
    # end
  end
  
  def set_organization
    @organization = @farmer.organization
  end
end