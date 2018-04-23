module Api
  module V1
class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]


  # GET /orders
  def index

    @orders = Order.all.where(organization_id: current_user.organization_user.organization_id)

    render json: @orders, include: ["customer_company" ,"organization", "order_items", "order_items.item"]
  end

  # GET /orders/1
  def show
    render json: @order, include: ["customer_company" ,"organization", "order_items", "order_items.item"]
  end

  # POST /orders
  def create
    
    @order = Order.new(order_params)
  
    @order.organization_id = current_user.organization_user.organization_id
    
    if @order.save
      render json: @order, status: :created, location: "/api/v1/orders/"+@order.id.to_s
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    #@order.current_user = current_user
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:estimate_id, :customer_company_id, :order_date, :order_number, :remarks, :organization_id, order_items_attributes: [:id, :item_id, :cost_of_item, :no_of_items], document_attributes:[:id, :document_name, :url, :document_type])
    end

   
end
end
end
