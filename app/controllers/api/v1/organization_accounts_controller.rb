module Api
  module V1
class OrganizationAccountsController < ApplicationController
  before_action :set_organization_account, only: [:show, :update, :destroy]

  # GET /organization_accounts
  def index
    @organization_accounts = OrganizationAccount.all

    render json: @organization_accounts
  end

  # GET /organization_accounts/1
  def show
    render json: @organization_account
  end

  # POST /organization_accounts
  def create
    @organization_account = OrganizationAccount.new(organization_account_params)

    if @organization_account.save
      render json: @organization_account, status: :created, location: @organization_account
    else
      render json: @organization_account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /organization_accounts/1
  def update
    
    if @organization_account.update(organization_account_params)
      render json: @organization_account
    else
      render json: @organization_account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /organization_accounts/1
  def destroy
    @organization_account.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization_account
      @organization_account = OrganizationAccount.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def organization_account_params
      
      params.require(:organization_account).permit(:fiscal_year_start_month, :currency_code, :currency_symbol, :organization_id)
    end
end
end
end