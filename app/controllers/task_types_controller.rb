class TaskTypesController < ApplicationController
  before_action :set_task_type, only: [:show, :edit, :update, :destroy]
  before_action :set_organization

  def index
    # authorize @organization
    respond_to do |format|
      if @organization
        @task_types = TaskType.where(organization_id: @organization.id)
        format.json { render json: @task_types }
      else
        format.json { render json: {error: "Organization not found"}, status: :unprocessable_entity }
      end
    end
  end

  def show
    # authorize @task_type
  end

  def create
    @task_type = TaskType.new(task_type_params)
    #authorize @task_type
    
    respond_to do |format|
      if @task_type.save
        format.json { render json: @task_type, status: :created }
      else
        format.json { render json: @task_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # authorize @task_type
    respond_to do |format|
      if @task_type.update(task_type_params)
        format.json { render :show, status: :ok, location: @task_type }
      else
        format.json { render json: @task_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # authorize @task_type
    @task_type.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    def set_organization
      @organization = Organization.find_by(id: params[:organization_id])
    end

    def set_task_type
      @task_type = TaskType.find(params[:id])
    end

    def task_type_params
      params.require(:task_type).permit(:name, :organization_id, :description)
    end
end
