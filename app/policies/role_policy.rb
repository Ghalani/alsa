class RolePolicy
	attr_reader :current_user, :model
  before_filter :set_organization, except: [:index?, :create?, :add_role?]

	def initialize(current_user, model)
    @current_user = current_user
    @role = model
  end

  def index?
    @organization = @role
    (@organization.user == @current_user) || @current_user.is_member?(@organization)
  end

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

  def add_role?
    #param @role = [role, user]
    # role = @role[0]
    # user = @role[1]
    # @organization = role.organization

    # return true if @organization.user == @current_user || (@role.permissions['roles']["add_role"] )
    # return false if (@current_user == user) 
    
    # # if user also has the power to change roles
    # if (user.org_role(@organization).permissions['roles']['add_role'] || user.org_role(@organization).permissions['roles']['add_role'])
    #   return false
    # end
    @organization = @role    
    verify {"add_role"}
  end

  def verify(&block)
    return true if @organization.user == @current_user
      
    role = @current_user.org_role(@organization)
    begin
      return true if role.permissions['roles'][block.call]      
    rescue
      false
    end
  end
  
  def set_organization
    @organization = @role.organization
  end
end