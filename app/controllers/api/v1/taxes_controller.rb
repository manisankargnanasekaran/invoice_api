module Api
  module V1
class TaxesController < ApplicationController
  before_action :set_tax, only: [:show, :update, :destroy]

  # GET /taxes
  def index
    @taxes = Tax.where(organization_id: current_user.organization_user.organization_id).order(:id)

    render json: @taxes
  end

  # GET /taxes/1
  def show
    render json: @tax
  end

  # POST /taxes
  def create
    
    @tax = Tax.new(tax_params)
    @tax.organization_id = current_user.organization_user.organization_id

    if @tax.save

      render json: @tax, status: :created, location: "api/v1/taxes/"+@tax.id.to_s
    else
      render json: @tax.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /taxes/1
  def update

    if @tax.update(tax_params)
      render json: @tax
    else
      render json: @tax.errors, status: :unprocessable_entity
    end
  end

  # DELETE /taxes/1
  def destroy
    @tax.destroy
  end


  def tax
    @taxes = Tax.where(tax_category: false)

    render json: @taxes
  end

  def tax_type_intra
    
        @taxes = Tax.all.map{|i| i.tax_type.tax_division == "Intra State Tax" ? i : nil}.compact

        render json: @taxes
      end

  def tax_type_inter
        @taxes = Tax.all.map{|i| i.tax_type.tax_division == "Inter State Tax" ? i : nil}.compact

        render json: @taxes
  end

 def tax_detail
  @taxes = Tax.where(id: params[:tax_id])
  render json: @taxes

 end


  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tax
      @tax = Tax.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tax_params
      params.require(:tax).permit(:tax_name, :description, :percentage, :tax_category, :tax_type_id, :organization_id, :child_tax=>[])
    end
end
end
end