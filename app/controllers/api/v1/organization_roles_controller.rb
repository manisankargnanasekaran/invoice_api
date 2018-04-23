module Api
  module V1
class OrganizationRolesController < ApplicationController
  before_action :set_organization_role, only: [:show, :update, :destroy]

  # GET /organization_roles
  def index
    @organization_roles = OrganizationRole.all

    render json: @organization_roles
  end

  # GET /organization_roles/1
  def show
    render json: @organization_role
  end

  # POST /organization_roles
  def create

    @organization_role = OrganizationRole.new(organization_role_params)
    @organization_role.organization_id = current_user.organization_user.organization_id

    if @organization_role.save
      render json: @organization_role#, status: :created#, location: @organization_role

    else
      render json: @organization_role.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /organization_roles/1
  def update
    if @organization_role.update(organization_role_params)
      render json: @organization_role
    else
      render json: @organization_role.errors, status: :unprocessable_entity
    end
  end

  # DELETE /organization_roles/1
  def destroy
    @organization_role.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization_role
      @organization_role = OrganizationRole.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def organization_role_params
      params.require(:organization_role).permit(:role_name, :role_code, :department, :organization_id)
    end
end
end
end