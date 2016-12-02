class OrganizationPolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
    @current_user = current_user
    @organization = model
  end

  def index?
    (@organization.user == @current_user) || 
    @current_user.is_member?(@organization)
  end

  def new?
  	verify { "new" }    
  end

  def create?
  	verify { "create" }
  end

  def show?
    if @organization.user == @current_user
      return true
    else
      @current_user.is_member?(@organization)
    end  
  end

  def update?
  	verify { "update" }
  end

  def destroy?
  	(@organization.memberships.size < 1) && (verify { "destroy" } )
  end

  def farm_and_labour?
    verify { "farm_and_labour"}
  end

  def user_and_role?
    verify { "user_and_role" }
  end

  def location_and_hierarchy?
    verify { "location_and_hierarchy" }
  end

  def stock_management?
    verify { "stock_management" }
  end

  def add_member?
  end

  def change_role?
    return true if @organization.user == @current_user
      
    role = @current_user.org_role(@organization)
    begin
      return true if role.permissions['roles']['add_role']      
    rescue
      false
    end
  end

  def verify(&block)
    return true if @organization.user == @current_user
      
    role = @current_user.org_role(@organization)
    begin
      return true if role.permissions['organizations'][(block.call)]
    rescue
      return false
    end
  end
end