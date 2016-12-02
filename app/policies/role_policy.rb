class RolePolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
    @current_user = current_user
    @role = model
  end

  # def index?
  #   @organization = @role
  #   (@organization.user == @current_user) || @current_user.is_member?(@organization)
  # end

  # def new?
  # 	verify {}
  # end

  def create?
    @organization = @role
  	verify {"create"}
  end

  def show?
    verify{ "create" }
  end

  def update?
  	verify { "create" }
  end

  def destroy?
    verify { "destroy" } 
  end

  def verify(&block)
    @organization = @role.organization

    return true if @organization.user == @current_user
      
    role = @current_user.org_role(@organization)
    begin
      return true if role.permissions['roles'][block.call]      
    rescue
      false
    end
  end
end