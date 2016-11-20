class StoredStocksController < ApplicationController
  before_action :set_stored_stock, only: [:show, :edit, :update, :destroy]
  before_action :set_organization

  def index
    #@stored_stocks = StoredStock.all
    respond_to do |format|
      if @organization
        @stored_stocks = StoredStock.where(organization_id: @organization.id)
        format.json { render json: @stored_stocks }
      else
        format.json { render json: {error: "Organization not found"}, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def create
    @stored_stock = StoredStock.new(stored_stock_params)

    respond_to do |format|
      if @stored_stock.save
        #format.html { redirect_to [@organization, @stored_stock], notice: 'Stock type was successfully created.' }
        format.json { render json: @stored_stock, status: :created }
      else
        #format.html { render :new }
        format.json { render json: @stored_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @stored_stock.update(stored_stock_params)
        #format.html { redirect_to @stored_stock, notice: 'Stock type was successfully updated.' }
        format.json { render :show, status: :ok, location: @stored_stock }
      else
        #format.html { render :edit }
        format.json { render json: @stored_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @stored_stock.destroy
    respond_to do |format|
      #format.html { redirect_to stored_stocks_url, notice: 'Stock type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_organization
      @organization = Organization.find_by(id: params[:organization_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_stored_stock
      @stored_stock = StoredStock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stored_stock_params
      params.require(:stored_stock).permit(:organization_id, :stock_item_id, :storage_id, :incoming_stock_id, :quantity)
    end
end
