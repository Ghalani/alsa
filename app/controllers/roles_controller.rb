class RolesController < ApplicationController
  before_filter :set_organization
  before_filter :set_role, except: [:index, :create]

  def index
    authorize @organization
    respond_to do |format|
      @roles =  @organization.roles
      format.json{ render json: @roles}
    end
  end

  def create
    respond_to do |format|
      @role = Role.new(role_params)
      @role.organization = @organization
      authorize @organization
      if @role.save
        format.json { render json: @role, status: :created }
      else
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @role

    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to [@organization, @role], notice: 'Role was successfully updated.' }
        format.json { render json: @role, status: :ok}
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_role
    @role = Role.find(params[:role_id])
    @user = User.find(params[:user_id])
    authorize @organization, :change_role?
    respond_to do |format|
      if (current_user != @user) && @user.change_organization_role(@role)
        format.json{ render json: @role, status: :ok}
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_organization
      @organization = Organization.find_by(id: params[:organization_id])
    end

    def set_role
      @role = Role.find(params[:id])
    end

    def role_params
      #params.require(:role).permit(:name, permissions: [organizations: [], farmers: [], farms: [], labourers: []])
      params.require(:role).permit!
    end
end
