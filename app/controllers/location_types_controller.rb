class LocationTypesController < ApplicationController
  before_action :set_location_type, only: [:show, :edit, :update, :destroy]
  before_action :set_organization

  def index
    #@location_types = LocationType.all
    respond_to do |format|
      if @organization
        @location_types = LocationType.org_roots(@organization.id)
        format.json { render json: @location_types }
      else
        format.json { render json: {error: "Organization not found"}, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def new
    @location_type = LocationType.new
  end

  def edit
  end

  def create
    @location_type = LocationType.new(location_type_params)

    respond_to do |format|
      if @location_type.save
        #format.html { redirect_to [@organization, @location_type], notice: 'Location type was successfully created.' }
        format.json { render json: @location_type, status: :created }
      else
        #format.html { render :new }
        format.json { render json: @location_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @location_type.update(location_type_params)
        #format.html { redirect_to @location_type, notice: 'Location type was successfully updated.' }
        format.json { render :show, status: :ok, location: @location_type }
      else
        #format.html { render :edit }
        format.json { render json: @location_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @location_type.destroy
    respond_to do |format|
      format.html { redirect_to location_types_url, notice: 'Location type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_organization
      @organization = Organization.find_by(id: params[:organization_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_location_type
      @location_type = LocationType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_type_params
      params.require(:location_type).permit(:name, :organization_id, :parent_id)
    end
end
