module Api
  module V1
class TaxItemsController < ApplicationController
  before_action :set_tax_item, only: [:show, :update, :destroy]

  # GET /tax_items
  def index
    @tax_items = TaxItem.all

    render json: @tax_items
  end

  # GET /tax_items/1
  def show
    render json: @tax_item
  end

  # POST /tax_items
  def create
    @tax_item = TaxItem.new(tax_item_params)

    if @tax_item.save
      render json: @tax_item, status: :created, location: "/api/v1/tax_items/"+@tax_item.id.to_s
    else
      render json: @tax_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tax_items/1
  def update
    if @tax_item.update(tax_item_params)
      render json: @tax_item
    else
      render json: @tax_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tax_items/1
  def destroy
    @tax_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tax_item
      @tax_item = TaxItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tax_item_params
      params.require(:tax_item).permit(:percentage, :tax_id, :item_id)
    end
end
end
end