class IncomingStocksController < ApplicationController
  before_action :set_incoming_stock, only: [:show, :edit, :update, :destroy]
  before_action :set_organization

  def index
    #@incoming_stocks = IncomingStock.all
    authorize @organization
    respond_to do |format|
      if @organization
        @incoming_stocks = IncomingStock.where(organization_id: @organization.id)
        format.json { render json: @incoming_stocks }
      else
        format.json { render json: {error: "Organization not found"}, status: :unprocessable_entity }
      end
    end
  end

  def show
    authorize @incoming_stock    
  end

  def create
    @incoming_stock = IncomingStock.new(incoming_stock_params)
    authorize @incoming_stock    
    
    respond_to do |format|
      if @incoming_stock.save
        #format.html { redirect_to [@organization, @incoming_stock], notice: 'Stock type was successfully created.' }
        format.json { render json: @incoming_stock, status: :created }
      else
        #format.html { render :new }
        format.json { render json: @incoming_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @incoming_stock    
    respond_to do |format|
      if @incoming_stock.update(incoming_stock_params)
        #format.html { redirect_to @incoming_stock, notice: 'Stock type was successfully updated.' }
        format.json { render :show, status: :ok, location: @incoming_stock }
      else
        #format.html { render :edit }
        format.json { render json: @incoming_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @incoming_stock    
    @incoming_stock.destroy
    respond_to do |format|
      #format.html { redirect_to incoming_stocks_url, notice: 'Stock type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_organization
      @organization = Organization.find_by(id: params[:organization_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_incoming_stock
      @incoming_stock = IncomingStock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incoming_stock_params
      params.require(:incoming_stock).permit(:organization_id, :stock_item_id, :stock_source_id, :receiver_id, :quantity, :arrived_at)
    end
end
