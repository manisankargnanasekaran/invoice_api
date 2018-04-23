module Api
  module V1

class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :update, :destroy]

  # GET /expenses
  def index
    @expenses = Expense.all

    render json: @expenses
  end

  # GET /expenses/1
  def show
    render json: @expense
  end

  # POST /expenses
  def create
    
    @expense = Expense.new(expense_params)

    #@expense.organization_id = current_user.organization_user.organization_id

    if @expense.save
      render json: @expense#, status: :created, location: @expense
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /expenses/1
  def update

    if @expense.update(expense_params)
      if @expense.item_wise == false
      @expense.expense_items.map{|i| i.delete}
      end
      render json: @expense
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  # DELETE /expenses/1
  def destroy
    @expense.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def expense_params
      params.require(:expense).permit(:expenses_date, :item_wise, :expenses_type, :expenses_code, :amount, :gst_number, :vendor_invoice_number, :remarks, :expenses_number, :expense_category_id, :gst_treatment_id, :place_of_supply_id, :tax_id, :customer_company_id, :document_id, expense_items_attributes: [:id, :expense_type, :expense_code, :particular, :description, :amount, :tax_id, :expense_id, :expense_category_id ])
    end
end
end
end