class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]
  before_action only: [:user_and_role, :farm_and_labour, :add_member, :location_and_hierarchy, :stock_management] do
    set_organization(params[:organization_id])
  end
  # GET /organizations
  # GET /organizations.json
  def index
    if current_user.admin?
      @organizations = Organization.all
    else
      @organizations = current_user.get_member_orgs
    end
    authorize Organization
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    @organization = Organization.find(params[:id])
    authorize @organization
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
    @countries = Country.all
    authorize @organization
  end

  # GET /organizations/1/edit
  def edit
    page = params[:page]
    if page
      render "organizations/users/"+page
    end
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)
    @organization.user = current_user
    authorize @organization

    respond_to do |format|
      if @organization.save
        format.html { redirect_to organizations_path, notice: 'Organization was successfully created.' }
        format.json { render json: @organization }
      else
        format.html { render :new }
        format.json { render @organization.errors }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    respond_to do |format|
      authorize @organization
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    authorize @organization
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def add_member
  #   authorize @organization    
  #   @organization = Organization.find(params[:organization_id])
  #   user = User.find(params[:user_id])
  #   respond_to do |format|
  #     if (@organization.members << user)
  #       format.json{render json: {success: "user added successfully"}}
  #     else
  #       format.json{render json:{error: @organization.errors.full_message}}
  #     end
  #   end
  # end

  def farm_and_labour
    authorize @organization
    render 'organizations/farm_and_labour/index'
  end

  def user_and_role
    authorize @organization
    render 'organizations/user_and_role/index'
  end

  def location_and_hierarchy
    authorize @organization
    render 'organizations/location_and_hierarchy/index'
  end

  def stock_management
    authorize @organization
    render 'organizations/stock_management/index'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization (id = params[:id])
      @organization = Organization.find(id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:name, :country_id, :bio, :currency_id, :image)
    end
end
