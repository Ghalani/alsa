class FarmsController < ApplicationController
  before_action :set_organization
  before_action :set_farm, only: [:show, :edit, :update, :destroy]

  # GET /farms
  # GET /farms.json
  def index
    respond_to do |format|
      if @organization
        authorize @organization
        if params[:farmer_id]
          @farms = Farmer.find(params[:farmer_id]).farms
        else
          @farms = @organization.farms
        end

        format.html
        format.json{ render json: @farms}
      else
        @farms = Farm.all
      end
    end
  end

  # GET /farms/1
  # GET /farms/1.json
  def show
    authorize @farm
  end

  # GET /farms/new
  def new
    authorize @organization    
    @farm = Farm.new
  end

  # GET /farms/1/edit
  def edit
  end

  # POST /farms
  # POST /farms.json
  def create
    @farm = Farm.new(farm_params)
    @farm.organization = @organization
    authorize @farm    

    respond_to do |format|
      if @farm.save
        format.html { redirect_to [@organization, @farm], notice: 'Farm was successfully created.' }
        format.json { render json: @farm, status: :created }
      else
        format.html { render :new }
        format.json { render json: @farm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /farms/1
  # PATCH/PUT /farms/1.json
  def update
    authorize @farm
    
    respond_to do |format|
      if @farm.update(farm_params)
        format.html { redirect_to [@organization, @farm], notice: 'Farm was successfully updated.' }
        format.json { render json: @farm, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @farm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /farms/1
  # DELETE /farms/1.json
  def destroy
    authorize @farm
    
    @farm.destroy
    respond_to do |format|
      format.html { redirect_to farms_url, notice: 'Farm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farm
      begin
        @farm = Farm.find(params[:id])
      rescue
        flash[:notice] = "This farm is no longer in your system..."
        redirect_to organization_farm_and_labour_path(@organization)
      end
    end

    def set_organization
      @organization = Organization.find_by(id: params[:organization_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def farm_params
      params.require(:farm).permit(:name, :size, :lat, :lng, :village_id, :farmer_id, points:[])
    end
end
