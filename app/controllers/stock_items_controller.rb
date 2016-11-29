class StockItemsController < ApplicationController
  before_action :set_stock_item, only: [:show, :edit, :update, :destroy]
  before_action :set_organization

  def index
    #@stock_items = StockItem.all
    respond_to do |format|
      if @organization
        @stock_items = StockItem.where(organization_id: @organization.id)
        format.json { render json: @stock_items }
      else
        format.json { render json: {error: "Organization not found"}, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def create
    @stock_item = StockItem.new(stock_item_params)

    respond_to do |format|
      if @stock_item.save
        #format.html { redirect_to [@organization, @stock_item], notice: 'Stock type was successfully created.' }
        format.json { render json: @stock_item, status: :created }
      else
        #format.html { render :new }
        format.json { render json: @stock_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @stock_item.update(stock_item_params)
        #format.html { redirect_to @stock_item, notice: 'Stock type was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock_item }
      else
        #format.html { render :edit }
        format.json { render json: @stock_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @stock_item.destroy
    respond_to do |format|
      #format.html { redirect_to stock_items_url, notice: 'Stock type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_organization
      @organization = Organization.find_by(id: params[:organization_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_stock_item
      @stock_item = StockItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_item_params
      params.require(:stock_item).permit(:name, :organization_id, :stock_type_id, :cost, :minimum_quantity, :image, extra:[])
    end
end
