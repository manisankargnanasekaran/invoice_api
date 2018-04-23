module Api
  module V1
    class TaxTypesController < ApplicationController
      before_action :set_tax_type, only: [:show, :update, :destroy]

      # GET /tax_types
      def index
        @tax_types = TaxType.all

        render json: @tax_types
      end

      # GET /tax_types/1
      def show
        render json: @tax_type
      end

      # POST /tax_types
      def create
      
        @tax_type = TaxType.new(tax_type_params)

        if @tax_type.save
          render json: @tax_type, status: :created, location: "api/v1/tax_types/"+@tax_type.id.to_s
        else
          render json: @tax_type.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /tax_types/1
      def update
        
        if @tax_type.update(tax_type_params)
          render json: @tax_type
        else
          render json: @tax_type.errors, status: :unprocessable_entity
        end
      end

      # DELETE /tax_types/1
      def destroy
        @tax_type.destroy
      end

      # def tax_type_intra
      #   @tax_types = TaxType.where(tax_division: "Intra State Tax")

      #   render json: @tax_types
      # end

      # def tax_type_inter
      #   @tax_types = TaxType.where(tax_division: "Inter State Tax")

      #   render json: @tax_types
      # end



      private
        # Use callbacks to share common setup or constraints between actions.
        def set_tax_type
          @tax_type = TaxType.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def tax_type_params
          params.require(:tax_type).permit!#(:tax_type, :tax_division)
        end
    end
  end
end
