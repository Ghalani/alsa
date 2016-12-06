class FarmerPolicy
	attr_reader :current_user, :model  


	def initialize(current_user, model)
    @current_user = current_user
    @farmer = model
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
    @organization = @farmer.organization
    return true if @organization.user == @current_user
      
    role = @current_user.org_role(@farmer.organization)
    begin
      return true if role.permissions['farmers'][block.call]      
    rescue
      false
    end
  end
end