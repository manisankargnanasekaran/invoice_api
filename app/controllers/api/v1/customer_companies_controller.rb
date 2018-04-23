module Api
  module V1
    class CustomerCompaniesController < ApplicationController
      before_action :set_customer_company, only: [:show, :update, :destroy, :update_billing_address, :update_shipping_address]
      # GET /customer_companies
      def index
        @customer_companies = CustomerCompany.where(organization_id: current_user.organization_user.organization_id)#CustomerCompany.all
        render json: @customer_companies#, include: [ "customer_contact_people.contact", "organization", "contact", "address", "social_network", "customer_contact_people", "customer_account", "customer_account.address"]
      end

      # GET /customer_companies/1
      def show
        #byebug  @customer_company.customer_contact_people.order( 'created_at  ASC' )
     
        render json: @customer_company#, include: [ "customer_contact_people.contact", "organization", "contact", "address", "social_network", "customer_contact_people", "customer_account", "customer_account.address"]
      end

      # POST /customer_companies
      def create

        @customer_company = CustomerCompany.new(customer_company_params)
        @customer_company.organization_id = current_user.organization_user.organization_id
        @customer_company.customer_contact_people.map{|i| i.organization_id = current_user.organization_user.organization_id}
       
        if @customer_company.save
          render json: @customer_company, status: :created, location: "/api/v1/customer_company/"+@customer_company.id.to_s
        else
          render json: @customer_company.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /customer_companies/1
      def update

        if @customer_company.update(customer_company_params)
          render json: @customer_company
        else
          render json: @customer_company.errors, status: :unprocessable_entity
        end
      end

      # DELETE /customer_companies/1
      def destroy
        @customer_company.destroy
      end

      def get_customer_company
      @customer_companies = CustomerCompany.where(organization_id: current_user.organization_user.organization_id)
      render json: @customer_companies
      end

      def update_billing_address
      @customer_company.address.update(address_line1: params[:address_line1], address_line2: params[:address_line2], city: params[:city], state: params[:state], country: params[:country], postal_code: params[:postal_code])
      end

      def update_shipping_address
     
        @customer_company.customer_account.address.update(address_line1: params[:address_line1], address_line2: params[:address_line2], city: params[:city], state: params[:state], country: params[:country], postal_code: params[:postal_code])
      end


      private
      # Use callbacks to share common setup or constraints between actions.
      def set_customer_company
        @customer_company = CustomerCompany.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def customer_company_params
        params.require(:customer_company).permit(:company_name, :company_code, :location, :website, :organization_id, :display_name, :remarks,address_attributes: [:id, :address_line1,:address_line2, :city, :state, :country, :postal_code],contact_attributes:[:id,:email,:mobile,:fax],social_network_attributes:[:id,:facebook,:twitter,:skype,:google_plus,:linkedin],customer_account_attributes: [:id, :tin, :gst_no, :tan, :pan, :gst_treatment_id, :currency, :payment_terms, :taxable, :tax_exempt_reason, :place_of_supply, address_attributes: [:id, :address_line1,:address_line2, :city, :state, :country, :postal_code]],customer_contact_people_attributes:[:id, :salutation, :first_name, :last_name, :department, :is_primary, contact_attributes:[:id, :email, :mobile, :fax],address_attributes: [:id, :address_line1,:address_line2, :city, :state, :country, :postal_code]])
      end

     

    end
  end
end