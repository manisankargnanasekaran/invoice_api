module Api
  module V1
class OrganizationUsersController < ApplicationController
  before_action :set_organization_user, only: [:show, :update, :destroy]

  # GET /organization_users
  def index
    @organization_users = OrganizationUser.all

    render json: @organization_users
  end

  # GET /organization_users/1
  def show
    render json: @organization_user
  end

  # POST /organization_users
  def create

    @organization_user = OrganizationUser.new(organization_user_params)
    @organization_user.organization_id = current_user.organization_user.organization_id
    if @organization_user.save
      render json: @organization_user#, status: :created, location: @organization_user
    else
      render json: @organization_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /organization_users/1
  def update
    if @organization_user.update(organization_user_params)
      render json: @organization_user
    else
      render json: @organization_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /organization_users/1
  def destroy
    @organization_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization_user
      @organization_user = OrganizationUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def organization_user_params
      params.require(:organization_user).permit(:salutation, :first_name, :last_name, :gender, :department, :deleted_at, :is_primary, :organization_role_id, :organization_id, address_attributes: [:id, :address_line1,:address_line2, :city, :state, :country, :postal_code], contact_attributes: [:id,:email,:mobile,:fax])
    end
end
end
end