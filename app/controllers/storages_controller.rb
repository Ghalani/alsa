class StoragesController < ApplicationController
  before_action :set_storage, only: [:show, :edit, :update, :destroy]
  before_action :set_organization

  def index
    #@storages = Storage.all
    authorize @organization

    respond_to do |format|
      if @organization
        @storages = Storage.where(organization_id: @organization.id)
        format.json { render json: @storages }
      else
        format.json { render json: {error: "Organization not found"}, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def create
    @storage = Storage.new(storage_params)

    authorize @storage
    respond_to do |format|
      if @storage.save
        #format.html { redirect_to [@organization, @storage], notice: 'Stock type was successfully created.' }
        format.json { render json: @storage, status: :created }
      else
        #format.html { render :new }
        format.json { render json: @storage.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @storage
    respond_to do |format|
      if @storage.update(storage_params)
        #format.html { redirect_to @storage, notice: 'Stock type was successfully updated.' }
        format.json { render :show, status: :ok, location: @storage }
      else
        #format.html { render :edit }
        format.json { render json: @storage.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @storage
    @storage.destroy
    respond_to do |format|
      #format.html { redirect_to storages_url, notice: 'Stock type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_organization
      @organization = Organization.find_by(id: params[:organization_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_storage
      @storage = Storage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def storage_params
      params.require(:storage).permit(:name, :organization_id, :location_id)
    end
end
