class StockTypesController < ApplicationController
  before_action :set_stock_type, only: [:show, :edit, :update, :destroy]
  before_action :set_organization

  def index
    #@stock_types = StockType.all
    authorize @organization
    respond_to do |format|
      if @organization
        @stock_types = StockType.where(organization_id: @organization.id)
        format.json { render json: @stock_types }
      else
        format.json { render json: {error: "Organization not found"}, status: :unprocessable_entity }
      end
    end
  end

  def show
    authorize @stock_type
  end

  def create
    @stock_type = StockType.new(stock_type_params)
    authorize @stock_type
    
    respond_to do |format|
      if @stock_type.save
        #format.html { redirect_to [@organization, @stock_type], notice: 'Stock type was successfully created.' }
        format.json { render json: @stock_type, status: :created }
      else
        #format.html { render :new }
        format.json { render json: @stock_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @stock_type
    respond_to do |format|
      if @stock_type.update(stock_type_params)
        #format.html { redirect_to @stock_type, notice: 'Stock type was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock_type }
      else
        #format.html { render :edit }
        format.json { render json: @stock_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @stock_type
    @stock_type.destroy
    respond_to do |format|
      #format.html { redirect_to stock_types_url, notice: 'Stock type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_organization
      @organization = Organization.find_by(id: params[:organization_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_stock_type
      @stock_type = StockType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_type_params
      params.require(:stock_type).permit(:name, :organization_id, :unit, extra_fields:[])
    end
end
