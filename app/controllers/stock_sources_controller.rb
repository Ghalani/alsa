class StockSourcesController < ApplicationController
  before_action :set_stock_source, only: [:show, :edit, :update, :destroy]
  before_action :set_organization

  def index
    #@stock_sources = StockSource.all
    respond_to do |format|
      if @organization
        @stock_sources = StockSource.where(organization_id: @organization.id)
        format.json { render json: @stock_sources }
      else
        format.json { render json: {error: "Organization not found"}, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def create
    @stock_source = StockSource.new(stock_source_params)

    respond_to do |format|
      if @stock_source.save
        #format.html { redirect_to [@organization, @stock_source], notice: 'Stock type was successfully created.' }
        format.json { render json: @stock_source, status: :created }
      else
        #format.html { render :new }
        format.json { render json: @stock_source.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @stock_source.update(stock_source_params)
        #format.html { redirect_to @stock_source, notice: 'Stock type was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock_source }
      else
        #format.html { render :edit }
        format.json { render json: @stock_source.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @stock_source.destroy
    respond_to do |format|
      #format.html { redirect_to stock_sources_url, notice: 'Stock type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_organization
      @organization = Organization.find_by(id: params[:organization_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_stock_source
      @stock_source = StockSource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_source_params
      params.require(:stock_source).permit(:name, :organization_id, :phone, :email, :address)
    end
end
