module Api
  module V1
    class CustomerPaymentsController < ApplicationController
      before_action :set_customer_payment, only: [:show, :update, :destroy]

      # GET /customer_payments
      def index
        @customer_payments = CustomerPayment.all#where(organization_id: current_user.organization_user.organization_id)

        render json: @customer_payments
      end

      # GET /customer_payments/1
      def show
        render json: @customer_payment#, include: ["payment_invoices", "payment_invoices" ]
      end

      # POST /customer_payments
      def create
        #byebug
        @customer_payment = CustomerPayment.new(customer_payment_params)
         @customer_payment.organization_id = current_user.organization_user.organization_id
        if @customer_payment.save
          render json: @customer_payment, status: :created, location: "/api/v1/customer_payments/"+@customer_payment.id.to_s
        else
          render json: @customer_payment.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /customer_payments/1
      def update
        if @customer_payment.update(customer_payment_params)
          render json: @customer_payment
        else
          render json: @customer_payment.errors, status: :unprocessable_entity
        end
      end

      # DELETE /customer_payments/1
      def destroy
        @customer_payment.destroy
      end

      def payment_invoice
        @payment_invoice = Invoice.where(customer_company_id: params[:customer_company_id]).where.not(payment_status: "Paid")
        render json: @payment_invoice

      end

      def payment_invoice_create
       #byebug
        @payment_invoice = PaymentInvoice.new(payment_invoice_params)
        #@payment_invoice.organization_id = current_user.organization_user.organization_id


        if @payment_invoice.save
           render json: @payment_invoice, status: :created, location: "/api/v1/payment_invoices/"+@payment_invoice.id.to_s
        else
          render json: @payment_invoice.errors, status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_customer_payment
          @customer_payment = CustomerPayment.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def customer_payment_params
          params.require(:customer_payment).permit(:payment_mode, :payment_date, :customer_company_id, :amount, :reference_number, :description, :transaction_charges, :payment_type, payment_invoices_attributes:[:id, :invoice_id, :invoice_amount])
        end

        def payment_invoice_params
          params.require(:payment_invoice).permit!
        end
    end
  end
end