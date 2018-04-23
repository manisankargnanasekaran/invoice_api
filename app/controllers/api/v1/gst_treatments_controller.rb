module Api
  module V1
class GstTreatmentsController < ApplicationController
  before_action :set_gst_treatment, only: [:show, :update, :destroy]

  # GET /gst_treatments
  def index
    
    @gst_treatments = GstTreatment.all#.where(organization_id: current_user.organization_user.organization_id)

    render json: @gst_treatments
  end

  # GET /gst_treatments/1
  def show
    render json: @gst_treatment
  end

  # POST /gst_treatments
  def create
    
    @gst_treatment = GstTreatment.new(gst_treatment_params)

    if @gst_treatment.save
      render json: @gst_treatment, status: :created, location: "/api/v1/gst_treatments/"+@gst_treatment.id.to_s
    else
      render json: @gst_treatment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gst_treatments/1
  def update
    if @gst_treatment.update(gst_treatment_params)
      render json: @gst_treatment
    else
      render json: @gst_treatment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gst_treatments/1
  def destroy
    @gst_treatment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gst_treatment
      @gst_treatment = GstTreatment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gst_treatment_params
      params.require(:gst_treatment).permit(:name, :description, :gst_required)
    end
end
end
end
