module Api
  module V1

class ExpenseCategoriesController < ApplicationController
  before_action :set_expense_category, only: [:show, :update, :destroy]

  # GET /expense_categories
  def index
    @expense_categories = ExpenseCategory.all

    render json: @expense_categories
  end

  # GET /expense_categories/1
  def show
    render json: @expense_category
  end

  # POST /expense_categories
  def create
    @expense_category = ExpenseCategory.new(expense_category_params)
     @expense_category.organization_id = current_user.organization_user.organization_id
    if @expense_category.save
      render json: @expense_category#, status: :created, location: @expense_category
    else
      render json: @expense_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /expense_categories/1
  def update
    if @expense_category.update(expense_category_params)
       @expense_category.organization_id = current_user.organization_user.organization_id
      render json: @expense_category
    else
      render json: @expense_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /expense_categories/1
  def destroy
    @expense_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense_category
      @expense_category = ExpenseCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def expense_category_params
      params.require(:expense_category).permit(:name, :description, :organization_id)
    end
end
end
end