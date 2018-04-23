module Api
  module V1
   class CustomerContactPeopleController < ApplicationController
  before_action :set_customer_contact_person, only: [:show, :update, :destroy]

  # GET /customer_contact_persons
  def index
    @customer_contact_people = CustomerContactPerson.where(organization_id: current_user.organization_user.organization_id)

    render json: @customer_contact_people
  end

  # GET /customer_contact_persons/1
  def show
    render json: @customer_contact_person
  end

  # POST /customer_contact_persons
  def create
  
    @customer_contact_person = CustomerContactPerson.new(customer_contact_person_params)
    @customer_contact_person.organization_id = current_user.organization_user.organization_id
    if @customer_contact_person.save
      render json: @customer_contact_person#, status: :created, location: @customer_contact_person
    else
      render json: @customer_contact_person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customer_contact_persons/1
  def update

    if @customer_contact_person.update(customer_contact_person_params)
      render json: @customer_contact_person
    else
      render json: @customer_contact_person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customer_contact_persons/1
  def destroy
    @customer_contact_person.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_contact_person
      @customer_contact_person = CustomerContactPerson.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def customer_contact_person_params
      params.require(:customer_contact_person).permit(:salutation, :first_name, :last_name, :department, :is_primary, :customer_company_id, :organization_id, contact_attributes: [:id, :email, :mobile, :fax, :is_primary], address_attributes: [:id, :address_line1,:address_line2, :city, :state, :country, :postal_code])
    end
  end
 end
end