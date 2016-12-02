class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :set_organization

  # GET /organizations/:id/locations
  # GET /organizations/:id/locations.json
  def index
    authorize @organization
    respond_to do |format|
      if @organization
        @locations = Location.org_roots(@organization.id)
        format.json { render json: @locations }
      else
        format.json { render json: {error: "Organization not found"}, status: :unprocessable_entity }
      end
    end
  end

  # GET /organizations/:id/locations/1
  # GET /organizations/:id/locations/1.json
  def show
    authorize @location
  end

  # GET /organizations/:id/locations/new
  def new
    @location = Location.new
  end

  # GET /organizations/:id/locations/1/edit
  def edit
    authorize @location    
  end

  # POST /organizations/:id/locations
  # POST /organizations/:id/locations.json
  def create
    @location = Location.new(location_params)
    authorize @location
    
    respond_to do |format|
      if @location.save
        #format.html { redirect_to [@organization, @location], notice: 'Location was successfully created.' }
        format.json { render json: @location, show_parent_tree: true , status: :created }
      else
        #format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/:id/locations/1
  # PATCH/PUT /organizations/:id/locations/1.json
  def update
    authorize @location

    respond_to do |format|
      if @location.update(location_params)
        #format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render json: @location, show_parent_tree: true , status: :ok}
      else
        #format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/:id/locations/1
  # DELETE /organizations/:id/locations/1.json
  def destroy
    authorize @location

    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_organization
      @organization = Organization.find_by(id: params[:organization_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:name, :location_type_id, :parent_id, :organization_id, :lat, :lng, :points)
    end
end
