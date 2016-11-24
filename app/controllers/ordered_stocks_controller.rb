class OrderedStocksController < ApplicationController
  before_action :set_ordered_stock, only: [:show, :edit, :update, :destroy]
  before_action :set_organization

  def index
    #@ordered_stocks = OrderedStock.all
    respond_to do |format|
      if @organization
        if params[:customer_order_id]
          @ordered_stocks = CustomerOrder.find(params[:customer_order_id]).ordered_stocks
        else
          @ordered_stocks = OrderedStock.where(organization_id: @organization.id)
        end
        format.json { render json: @ordered_stocks }
      else
        format.json { render json: {error: "Organization not found"}, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def create
    @ordered_stock = OrderedStock.new(ordered_stock_params)

    respond_to do |format|
      if @ordered_stock.save_and_update_quantity_taken
        format.json { render json: @ordered_stock, status: :created }
      else
        format.json { render json: @ordered_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ordered_stock.update(ordered_stock_params)
        #format.html { redirect_to @ordered_stock, notice: 'Stock type was successfully updated.' }
        format.json { render :show, status: :ok, location: @ordered_stock }
      else
        #format.html { render :edit }
        format.json { render json: @ordered_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ordered_stock.destroy
    respond_to do |format|
      #format.html { redirect_to ordered_stocks_url, notice: 'Stock type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_organization
      @organization = Organization.find_by(id: params[:organization_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_ordered_stock
      @ordered_stock = OrderedStock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ordered_stock_params
      params.require(:ordered_stock).permit(:organization_id, :ordered_stock_id, :stock_item_id, :storage_id, :stored_stock_id, :quantity, :requster_id)
    end
end
