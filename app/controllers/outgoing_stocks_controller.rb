class OutgoingStocksController < ApplicationController
  before_action :set_outgoing_stock, only: [:show, :edit, :update, :destroy]
  before_action :set_organization

  def index
    #@outgoing_stocks = OutgoingStock.all
    respond_to do |format|
      if @organization
        @outgoing_stocks = OutgoingStock.where(organization_id: @organization.id)
        format.json { render json: @outgoing_stocks }
      else
        format.json { render json: {error: "Organization not found"}, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def create
    @outgoing_stock = OutgoingStock.new(outgoing_stock_params)

    respond_to do |format|
      if @outgoing_stock.save_and_update_quantity_taken
        format.json { render json: @outgoing_stock, status: :created }
      else
        format.json { render json: @outgoing_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @outgoing_stock.update(outgoing_stock_params)
        #format.html { redirect_to @outgoing_stock, notice: 'Stock type was successfully updated.' }
        format.json { render :show, status: :ok, location: @outgoing_stock }
      else
        #format.html { render :edit }
        format.json { render json: @outgoing_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @outgoing_stock.destroy
    respond_to do |format|
      #format.html { redirect_to outgoing_stocks_url, notice: 'Stock type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_organization
      @organization = Organization.find_by(id: params[:organization_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_outgoing_stock
      @outgoing_stock = OutgoingStock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def outgoing_stock_params
      params.require(:outgoing_stock).permit(:organization_id, :ordered_stock_id, :stock_item_id, :storage_id, :stored_stock_id, :quantity, :requster_id)
    end
end
