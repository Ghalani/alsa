class RolesController < ApplicationController
  before_filter :set_organization
  def index
    authorize Role
    respond_to do |format|
      @roles =  @organization.roles
      format.json{ render json: @roles}
    end
  end

  def create
    respond_to do |format|
      @role = Role.new(role_params)
      @role.organization = @organization
      authorize @role
      if @role.save
        format.json { render json: @role, status: :created }
      else
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_organization
      @organization = Organization.find_by(id: params[:organization_id])
    end

    def role_params
      params.require(:role).permit(:name, permissions: {})
    end
end
