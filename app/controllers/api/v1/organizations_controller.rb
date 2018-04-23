module Api
  module V1
class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :update, :destroy]

  # GET /organizations
  def index
    @organizations = Organization.all

    render json: @organizations
  end

  # GET /organizations/1
  def show
    render json: @organization
  end

  # POST /organizations
  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      render json: @organization, status: :created, location: @organization
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /organizations/1
  def update
    if @organization.update(organization_params)
      render json: @organization
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  # DELETE /organizations/1
  def destroy
    @organization.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def organization_params
      params.require(:organization).permit(:organization_name, :organization_logo, :organization_website, :business_location, :tenant_id, address_attributes: [:id, :address_line1,:address_line2, :city, :state, :country, :postal_code], contact_attributes: [:id,:email,:mobile,:fax], business_category_attributes:[:id,:business_category_name,:business_category_code],organization_accounts_attributes:[:id,:fiscal_year_start_month,:currency_code,:currency_symbol])
    end
end
end
end