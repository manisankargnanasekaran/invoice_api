require 'test_helper'

class CustomerContactPersionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_contact_persion = customer_contact_persions(:one)
  end

  test "should get index" do
    get customer_contact_persions_url, as: :json
    assert_response :success
  end

  test "should create customer_contact_persion" do
    assert_difference('CustomerContactPersion.count') do
      post customer_contact_persions_url, params: { customer_contact_persion: { address_id: @customer_contact_persion.address_id, contact_id: @customer_contact_persion.contact_id, customer_company_id: @customer_contact_persion.customer_company_id, department: @customer_contact_persion.department, first_name: @customer_contact_persion.first_name, is_primary: @customer_contact_persion.is_primary, last_name: @customer_contact_persion.last_name, organization_id: @customer_contact_persion.organization_id, salutation: @customer_contact_persion.salutation } }, as: :json
    end

    assert_response 201
  end

  test "should show customer_contact_persion" do
    get customer_contact_persion_url(@customer_contact_persion), as: :json
    assert_response :success
  end

  test "should update customer_contact_persion" do
    patch customer_contact_persion_url(@customer_contact_persion), params: { customer_contact_persion: { address_id: @customer_contact_persion.address_id, contact_id: @customer_contact_persion.contact_id, customer_company_id: @customer_contact_persion.customer_company_id, department: @customer_contact_persion.department, first_name: @customer_contact_persion.first_name, is_primary: @customer_contact_persion.is_primary, last_name: @customer_contact_persion.last_name, organization_id: @customer_contact_persion.organization_id, salutation: @customer_contact_persion.salutation } }, as: :json
    assert_response 200
  end

  test "should destroy customer_contact_persion" do
    assert_difference('CustomerContactPersion.count', -1) do
      delete customer_contact_persion_url(@customer_contact_persion), as: :json
    end

    assert_response 204
  end
end
