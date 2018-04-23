class ExpenseItemsController < ApplicationController
  before_action :set_expense_item, only: [:show, :update, :destroy]

  # GET /expense_items
  def index
    @expense_items = ExpenseItem.all

    render json: @expense_items
  end

  # GET /expense_items/1
  def show
    render json: @expense_item
  end

  # POST /expense_items
  def create
    @expense_item = ExpenseItem.new(expense_item_params)

    if @expense_item.save
      render json: @expense_item, status: :created, location: @expense_item
    else
      render json: @expense_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /expense_items/1
  def update
    if @expense_item.update(expense_item_params)
      render json: @expense_item
    else
      render json: @expense_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /expense_items/1
  def destroy
    @expense_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense_item
      @expense_item = ExpenseItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def expense_item_params
      params.require(:expense_item).permit(:expense_type, :expense_code, :particular, :description, :amount, :tax_id, :expense_id, :expense_category_id)
    end
end
#expense_type, :expense_code, :particular, :description, :amount, :tax_id, :expense_id, :expense_category_id