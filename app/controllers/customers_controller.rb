class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :set_organization

  def index
    #@customers = Customer.all
    authorize @organization

    respond_to do |format|
      if @organization
        @customers = Customer.where(organization_id: @organization.id)
        format.json { render json: @customers }
      else
        format.json { render json: {error: "Organization not found"}, status: :unprocessable_entity }
      end
    end
  end

  def show
    authorize @customer    
  end

  def create
    @customer = Customer.new(customer_params)
    authorize @customer    

    respond_to do |format|
      if @customer.save
        #format.html { redirect_to [@organization, @customer], notice: 'Stock type was successfully created.' }
        format.json { render json: @customer, status: :created }
      else
        #format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @customer    
    respond_to do |format|
      if @customer.update(customer_params)
        #format.html { redirect_to @customer, notice: 'Stock type was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        #format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @customer    
    @customer.destroy
    respond_to do |format|
      #format.html { redirect_to customers_url, notice: 'Stock type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_organization
      @organization = Organization.find_by(id: params[:organization_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:organization_id, :name, :email, :phone, :address)
    end
end
