class MembershipsController < ApplicationController
  before_filter :set_organization
  def index
    authorize @organization
    respond_to do |format|
      @memberships =  @organization.memberships
      format.json{ render json: @memberships}
    end
  end

  # POST /organizations/:organization_id/memberships?user_id=:user_id
  def create
    respond_to do |format|
      @membership = Membership.new(membership_params)
      @membership.organization = @organization
      authorize @membership
      if @membership.save
        format.json { render json: @membership, status: :created }
      else
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
    # authorize @organization    
    # @organization = Organization.find(params[:organization_id])
    # user = User.find(params[:user_id])
    # respond_to do |format|
    #   if (@organization.members << user)
    #     format.json{render json: {success: "user added successfully"}}
    #   else
    #     format.json{render json:{error: @organization.errors.full_message}}
    #   end
    # end
  end

  private
    def set_organization
      @organization = Organization.find_by(id: params[:organization_id])
    end

    def membership_params
      params.require(:membership).permit(:organization_id, :user_id)
    end
end
