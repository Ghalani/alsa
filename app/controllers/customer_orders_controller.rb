class CustomerOrdersController < ApplicationController
  before_action :set_customer_order, only: [:show, :edit, :update, :destroy]
  before_action :set_organization

  def index
    #@customer_orders = CustomerOrder.all
    respond_to do |format|
      if @organization
        @customer_orders = CustomerOrder.where(organization_id: @organization.id)
        format.json { render json: @customer_orders }
      else
        format.json { render json: {error: "Organization not found"}, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def create
    @customer_order = CustomerOrder.new(customer_order_params)
    puts "#"*100
    puts ("OUT: " + ordered_stocks.to_json)
    respond_to do |format|
      if (@customer_order.save && 
        (ordered_stocks).map {|order|
          @customer_order.ordered_stocks.build(order[1]).save 
        })

        format.json { render json: @customer_order, status: :created }
      else
        @customer_order.destroy
        format.json { render json: @customer_order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @customer_order.update(customer_order_params)
        #format.html { redirect_to @customer_order, notice: 'Stock type was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer_order }
      else
        #format.html { render :edit }
        format.json { render json: @customer_order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer_order.destroy
    respond_to do |format|
      #format.html { redirect_to customer_orders_url, notice: 'Stock type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_organization
      @organization = Organization.find_by(id: params[:organization_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_customer_order
      @customer_order = CustomerOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_order_params
      params.require(:customer_order).permit(:organization_id, :customer_id, :status, :date_ordered, :deliverer_id, :date_delivered)
    end

    def ordered_stocks
      params.require(:ordered_stocks).permit!
    end
end
