class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :add_role]
  before_action :set_organization

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    authorize current_user
    respond_to do |format|
      format.html
      format.json{        
        if params[:organization_id]
          org = Organization.find(params[:organization_id])
          members = org.members
          non_members = User.all - members
          render json: {
            members: ActiveModel::Serializer::CollectionSerializer.new(members, each_serializer: UserSerializer), 
            non_members: ActiveModel::Serializer::CollectionSerializer.new(non_members, each_serializer: UserSerializer)
          }
        else  
          render json: {error: "Unable to process request"}
        end
      }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    authorize @user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_role
    puts "USER_ID " + @user.id.to_s  
    oldRole = @user.org_role(@organization) 
    newRole = Role.find(params[:role_id])
    @user.roles.delete(oldRole) if oldRole
    respond_to do |format|
      if @user.roles << newRole
        format.json{ render json: newRole, status: :ok}
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if params[:user_id]
        puts "8888888"*55
        @user = User.find(params[:user_id])
      else
        puts "82"*55      
        @user = User.find(params[:id])
      end
    end

    def set_organization
      @organization = Organization.find(params[:organization_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {})
    end
end
