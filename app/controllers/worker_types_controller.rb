class WorkerTypesController < ApplicationController
  before_action :set_worker_type, only: [:show, :edit, :update, :destroy]
  before_action :set_organization

  def index
    # authorize @organization
    respond_to do |format|
      if @organization
        @worker_types = WorkerType.where(organization_id: @organization.id)
        format.json { render json: @worker_types }
      else
        format.json { render json: {error: "Organization not found"}, status: :unprocessable_entity }
      end
    end
  end

  def show
    # authorize @worker_type
  end

  def create
    @worker_type = WorkerType.new(worker_type_params)
    #authorize @worker_type
    
    respond_to do |format|
      if @worker_type.save
        format.json { render json: @worker_type, status: :created }
      else
        format.json { render json: @worker_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # authorize @worker_type
    respond_to do |format|
      if @worker_type.update(worker_type_params)
        format.json { render :show, status: :ok, location: @worker_type }
      else
        format.json { render json: @worker_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # authorize @worker_type
    @worker_type.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    def set_organization
      @organization = Organization.find_by(id: params[:organization_id])
    end

    def set_worker_type
      @worker_type = WorkerType.find(params[:id])
    end

    def worker_type_params
      params.require(:worker_type).permit(:name, :organization_id, :unit, extra_fields:[])
    end
end
