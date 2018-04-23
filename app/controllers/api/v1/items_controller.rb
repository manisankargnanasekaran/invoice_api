module Api
  module V1
class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]

  # GET /items
  def index
    @items = Item.all

    render json: @items#, include: ["tax_items", "tax_items.tax", "unit"]
  end

  # GET /items/1
  def show
    #render json: @item.to_json(include: { tax_items: { include: :tax } })
     
    render json: @item#(include: { tax_items: { include: [:tax ] } })
  end

  # POST /items
  def create
    
    @item = Item.new(item_params)
    @item.organization_id = current_user.organization_user.organization_id

    if @item.save
      render json: @item, status: :created, location: "/api/v1/items/"+@item.id.to_s
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
  end

  def invioce_item
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:name, :description, :product_type, :cost_of_item, :code, :deleted_at, :unit_id, :organization_id, tax_items_attributes:[:id, :tax_id])
    end
end
end
end
