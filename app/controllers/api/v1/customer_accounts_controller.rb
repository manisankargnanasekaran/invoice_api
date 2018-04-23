module Api
  module V1
class CustomerAccountsController < ApplicationController
  before_action :set_customer_account, only: [:show, :update, :destroy]

  # GET /customer_accounts
  def index
    @customer_accounts = CustomerAccount.all

    render json: @customer_accounts
  end

  # GET /customer_accounts/1
  def show
    render json: @customer_account
  end

  # POST /customer_accounts
  def create
    @customer_account = CustomerAccount.new(customer_account_params)

    if @customer_account.save
      render json: @customer_account, status: :created, location: @customer_account
    else
      render json: @customer_account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customer_accounts/1
  def update
    if @customer_account.update(customer_account_params)
      render json: @customer_account
    else
      render json: @customer_account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customer_accounts/1
  def destroy
    @customer_account.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_account
      @customer_account = CustomerAccount.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def customer_account_params
      params.require(:customer_account).permit(:customer_company_id, :tin, :gst_no, :tan, :pan, :gst_treatment_id, :currency, :payment_terms, :taxable, :tax_exempt_reason, :place_of_supply, :shipping_address, :billing_address)
    end
end
end
end