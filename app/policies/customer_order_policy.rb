class CustomerOrderPolicy
	attr_reader :current_user, :model


	def initialize(current_user, model)
    @current_user = current_user
    @customer_order = model
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
    @organization = @customer_order.organization
    return true if @organization.user == @current_user
      
    role = @current_user.org_role(@organization)
    begin
      return true if role.permissions['customer_orders'][block.call]      
    rescue
      false
    end
  end
end