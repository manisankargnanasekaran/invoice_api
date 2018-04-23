module Api
  module V1
class BusinessCategoriesController < ApplicationController
  before_action :set_business_category, only: [:show, :update, :destroy]

  # GET /business_categories
  def index
    @business_categories = BusinessCategory.all

    render json: @business_categories
  end

  # GET /business_categories/1
  def show
    render json: @business_category
  end

  # POST /business_categories
  def create
    @business_category = BusinessCategory.new(business_category_params)

    if @business_category.save
      render json: @business_category, status: :created, location: @business_category
    else
      render json: @business_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /business_categories/1
  def update
    if @business_category.update(business_category_params)
      render json: @business_category
    else
      render json: @business_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /business_categories/1
  def destroy
    @business_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_category
      @business_category = BusinessCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def business_category_params
      params.require(:business_category).permit(:business_category_name, :business_category_code)
    end
end
end
end