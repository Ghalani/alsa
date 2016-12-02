class LabourerPolicy
	attr_reader :current_user, :model
  before_filter :set_organization, except: [:index?]

	def initialize(current_user, model)
    @current_user = current_user
    @labourer = model
  end

  def index?
    #verify {"index"}
    @organization = @labourer
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
    @organization = @labourer.organization

    return true if @organization.user == @current_user
      
    role = @current_user.org_role(@organization)
    begin
      return true if role.permissions['labourers'][block.call]      
    rescue
      false
    end
  end
end