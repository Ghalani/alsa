class MembershipPolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
    @current_user = current_user
    @membership = model
  end

  # def index?
  #   @organization = @membership
  #   (@organization.user == @current_user) || @current_user.is_member?(@organization)
  # end

  def create?
  	verify {"create"}
  end

  def destroy?
    verify { "destroy" } 
  end

  def verify(&block)
    @organization = @membership.organization
    return true if @organization.user == @current_user
      
    role = @current_user.org_role(@organization)
    begin
      return true if role.permissions['memberships'][block.call]      
    rescue
      false
    end
  end
end