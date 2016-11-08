class OrganizationPolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
    @current_user = current_user
    @org = model
  end

  def index?
    @current_user
  end

  def new?
  	verify { "new" }    
  end

  def create?
  	verify { "create" }
  end

  def show?
    verify{ "show" }
  end

  def update?
  	verify { "update" }
  end

  def destroy?
  	(@org.memberships.size < 1) && (verify { "destroy" } )
  end

  def farm_and_labour?
    verify { "farm_and_labour"}
  end

  def user_and_role?
    verify { "user_and_role" }
  end

  def verify(&block)
    role = @current_user.org_role(@org)
    if @org.user == @current_user
      return true
    elsif (role)
      # if (role.name == 'admin')
      #   return true
      # else
        role.permissions &&
        role.permissions > 0 && 
        role.permissions['organizations'] && 
        role.permissions['organizations'][(block.call)]
        #block.call
      # end
    else 
      return false
    end
  end
end