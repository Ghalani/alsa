class StockSourcePolicy
	attr_reader :current_user, :model


	def initialize(current_user, model)
    @current_user = current_user
    @stock_source = model
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
    @organization = @stock_source.organization
    return true if @organization.user == @current_user
      
    role = @current_user.org_role(@organization)
    begin
      return true if role.permissions['stock_sources'][block.call]      
    rescue
      false
    end
  end
end