class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_organization

  def index
    # authorize @organization
    respond_to do |format|
      if @organization
        @tasks = Task.where(organization_id: @organization.id)
        format.json { render json: @tasks }
      else
        format.json { render json: {error: "Organization not found"}, status: :unprocessable_entity }
      end
    end
  end

  def show
    # authorize @task
  end

  def create
    @task = Task.new(task_params)
    #authorize @task
    
    respond_to do |format|
      if @task.save
        format.json { render json: @task, status: :created }
      else
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # authorize @task
    respond_to do |format|
      if @task.update(task_params)
        format.json { render :show, status: :ok, location: @task }
      else
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # authorize @task
    @task.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    def set_organization
      @organization = Organization.find_by(id: params[:organization_id])
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :organization_id, :task_type_id, :description)
    end
end
