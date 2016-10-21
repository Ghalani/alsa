class FarmersController < ApplicationController
  before_action :set_farmer, only: [:show, :edit, :update, :destroy]
  before_action :set_organization

  # GET /farmers
  # GET /farmers.json
  def index
    authorize Farmer

    if @organization
      @farmers = @organization.farmers
      respond_to do |format|
        format.json{render json: @farmers}
      end
    else
      @farmers = Farmer.all
    end
  end

  # GET /farmers/1
  # GET /farmers/1.json
  def show
    # @organization is already set
    authorize @farmer
  end

  # GET /farmers/new
  def new
    @farmer = Farmer.new
    authorize Farmer

  end

  # GET /farmers/1/edit
  def edit
    authorize @farmer
  end

  # POST /farmers
  # POST /farmers.json
  def create
    @farmer = Farmer.new(farmer_params)
    authorize @farmer

    if @organization
      respond_to do |format|
        @farmer.organization = @organization
        if @farmer.save
          format.html { redirect_to [@organization, @farmer], notice: 'Farmer was successfully created.' }
          format.json { render :show, status: :created, location: @farmer }
        else
          format.html { render :new }
          format.json { render json: @farmer.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to '/', notice: "You have to add a user through an organization"
    end
  end

  # PATCH/PUT /farmers/1
  # PATCH/PUT /farmers/1.json
  def update
    authorize @farmer

    respond_to do |format|
      if @farmer.update(farmer_params)
        format.html { redirect_to @farmer, notice: 'Farmer was successfully updated.' }
        format.json { render :show, status: :ok, location: @farmer }
      else
        format.html { render :edit }
        format.json { render json: @farmer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /farmers/1
  # DELETE /farmers/1.json
  def destroy
    authorize @farmer

    @farmer.destroy
    respond_to do |format|
      format.html { redirect_to farmers_url, notice: 'Farmer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farmer
      @farmer = Farmer.find(params[:id])
    end

    def set_organization
      @organization = Organization.find_by(id: params[:organization_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def farmer_params
      params.require(:farmer).permit(:fname,:lname,:phone,:gender,
        :dob,:educational_level,:village,:caa_id,
        :kcl_district_id,:certified,:marital_status,:num_of_sharecroppers)
    end
end
