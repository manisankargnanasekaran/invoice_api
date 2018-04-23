module Api
  module V1
class EstimateItemsController < ApplicationController
  before_action :set_estimate_item, only: [:show, :update, :destroy]

  # GET /estimate_items
  def index
    @estimate_items = EstimateItem.where(organization_id: current_user.organization_user.organization_id)

    render json: @estimate_items
  end

  # GET /estimate_items/1
  def show
    render json: @estimate_item
  end

  # POST /estimate_items
  def create
    @estimate_item = EstimateItem.new(estimate_item_params)

    if @estimate_item.save
      render json: @estimate_item, status: :created, location: @estimate_item
    else
      render json: @estimate_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /estimate_items/1
  def update
    if @estimate_item.update(estimate_item_params)
      render json: @estimate_item
    else
      render json: @estimate_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /estimate_items/1
  def destroy
    @estimate_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estimate_item
      @estimate_item = EstimateItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def estimate_item_params
      params.require(:estimate_item).permit(:cost_of_item, :quantity, :remarks, :item_id, :estimate_id)
    end
end
end
end