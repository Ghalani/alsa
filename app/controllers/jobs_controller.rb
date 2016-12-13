class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :set_organization

  def index
    # authorize @organization
    respond_to do |format|
      if @organization
        @jobs = Job.where(organization_id: @organization.id)
        format.json { render json: @jobs }
      else
        format.json { render json: {error: "Organization not found"}, status: :unprocessable_entity }
      end
    end
  end

  def show
    # authorize @job
  end

  def create
    @job = Job.new(job_params)
    #authorize @job
    
    respond_to do |format|
      if @job.save
        format.json { render json: @job, status: :created }
      else
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # authorize @job
    respond_to do |format|
      if @job.update(job_params)
        format.json { render :show, status: :ok, location: @job }
      else
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # authorize @job
    @job.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    def set_organization
      @organization = Organization.find_by(id: params[:organization_id])
    end

    def set_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:name, :organization_id, :unit, extra_fields:[])
    end
end
