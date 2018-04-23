module Api
  module V1
class EstimatesController < ApplicationController
  before_action :set_estimate, only: [:show, :update, :destroy]

  # GET /estimates
  def index
    @estimates = Estimate.where(organization_id: current_user.organization_user.organization_id)

    render json: @estimates
  end

  # GET /estimates/1
  def show
    render json: @estimate
  end

  # POST /estimates
  def create
    
    @estimate = Estimate.new(estimate_params)

    if @estimate.save
      render json: @estimate, status: :created, location: @estimate
    else
      render json: @estimate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /estimates/1
  def update
    if @estimate.update(estimate_params)
      render json: @estimate
    else
      render json: @estimate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /estimates/1
  def destroy
    @estimate.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estimate
      @estimate = Estimate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def estimate_params
      params.require(:estimate).permit(:estimete_number, :date_of_estimete, :expiry_date, :name_of_estimate, :message, :discount_name, :discount_percentage, :terms_and_condition, :remarks, :estimate_status, :customer_company_id, :organization_id, :organization_user_id, :customer_contact_person_id)
    end
end
end
end