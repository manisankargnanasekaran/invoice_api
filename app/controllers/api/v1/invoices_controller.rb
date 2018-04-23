module Api
  module V1
    class InvoicesController < ApplicationController
      before_action :set_invoice, only: [:show, :update, :destroy]

      # GET /invoices
      def index
        @invoices = Invoice.where(organization_id: current_user.organization_user.organization_id)

        render json: @invoices#, include: ["customer_company","invoice_items.tax", "invoice_items.item"  ]
      end

      # GET /invoices/1
      def show
        render json: @invoice#, include: [ "customer_company", "invoice_items.tax", "invoice_items.item" ]
      end

      # POST /invoices
      def create
        
        @invoice = Invoice.new(invoice_params)
        @invoice.organization_id = current_user.organization_user.organization_id
        
        @invoice.invoice_items.map{|data|data.organization_id = current_user.organization_user.organization_id}

        if @invoice.save
          render json: @invoice, status: :created, location: "/api/v1/invoices/"+@invoice.id.to_s
        else
          render json: @invoice.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /invoices/1
      def update
        byebug
        if @invoice.update(invoice_params)
          render json: @invoice
        else
          render json: @invoice.errors, status: :unprocessable_entity
        end
      end

      # DELETE /invoices/1
      def destroy

        @invoice.destroy
      end

      def place_of_supply
        @place_of_supply = PlaceOfSupply.all
        
        render json: @place_of_supply
      end
       

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_invoice
          @invoice = Invoice.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def invoice_params
         
          params.require(:invoice).permit(:invoice_prefix, :invoice_number, :payment_terms, :due_date, :invoice_date, :customer_company_id, :grand_total, :balance, :discount_total, :organization_id, :estimate_id, :order_id, :payment_status, :sub_total, :tax_total, :shipping_charge, :adjustment_charge, :adjustment_description, :place_of_supply, invoice_items_attributes:[:id, :item_id, :description, :cost_of_item, :organization_id , :invoice_id, :tax_id, :number_of_item, :tax_cost, :sub_total, :discount_amount, :discount_percentage], document_attributes:[:id, :document_name, :url, :document_type])
        end
    end
  end
end
