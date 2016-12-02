class LabourersController < ApplicationController
  before_action :set_labourer, only: [:show, :edit, :update, :destroy]
  before_action :set_organization

  def index
    authorize @organization
    if @organization
      @labourers = @organization.labourers
      respond_to do |format|
        format.json{render json: @labourers}
      end
    else
      @labourers = Labourer.all      
    end
  end

  def show
    authorize @labourer
  end

  def new
    authorize Labourer
    @labourer = Labourer.new
  end

  def edit
    authorize @labourer
  end 

  def create
    @labourer = Labourer.new(labourer_params)
    authorize @labourer

    respond_to do |format|
      if @labourer.save
        format.html { redirect_to [@organization, @labourer], notice: 'Labourer was successfully created.' }
        format.json { render :show, status: :created, location: @labourer }
      else
        format.html { render :new }
        format.json { render json: @labourer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @labourer
    respond_to do |format|
      if @labourer.update(labourer_params)
        format.html { redirect_to [@organization, @labourer], notice: 'Labourer was successfully updated.' }
        format.json { render :show, status: :ok, location: @labourer }
      else
        format.html { render :edit }
        format.json { render json: @labourer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @labourer
    @labourer.destroy
    respond_to do |format|
      format.html { redirect_to [@organization, @labourer], notice: 'Labourer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_labourer
      @labourer = Labourer.find(params[:id])
    end

    def set_organization
      @organization = Organization.find_by(id: params[:organization_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def labourer_params
      params.require(:labourer).permit(:fname,:lname,:phone,:gender)
    end
end
