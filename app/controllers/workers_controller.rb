class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update, :destroy]
  before_action :set_organization

  def index
    # authorize @organization
    respond_to do |format|
      if @organization
        @workers = Worker.where(organization_id: @organization.id)
        format.json { render json: @workers }
      else
        format.json { render json: {error: "Organization not found"}, status: :unprocessable_entity }
      end
    end
  end

  def show
    # authorize @worker
  end

  def create
    @worker = Worker.new(worker_params)
    #authorize @worker
    
    respond_to do |format|
      if @worker.save
        format.json { render json: @worker, status: :created }
      else
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # authorize @worker
    respond_to do |format|
      if @worker.update(worker_params)
        format.json { render :show, status: :ok, location: @worker }
      else
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # authorize @worker
    @worker.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    def set_organization
      @organization = Organization.find_by(id: params[:organization_id])
    end

    def set_worker
      @worker = Worker.find(params[:id])
    end

    def worker_params
      params.require(:worker).permit(:name, :organization_id, :unit, extra_fields:[])
    end
end
