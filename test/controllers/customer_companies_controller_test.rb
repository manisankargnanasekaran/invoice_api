require 'test_helper'

class CustomerCompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_company = customer_companies(:one)
  end

  test "should get index" do
    get customer_companies_url, as: :json
    assert_response :success
  end

  test "should create customer_company" do
    assert_difference('CustomerCompany.count') do
      post customer_companies_url, params: { customer_company: { address_id: @customer_company.address_id, company_code: @customer_company.company_code, company_name: @customer_company.company_name, contact_id: @customer_company.contact_id, customer_companycol: @customer_company.customer_companycol, display_name: @customer_company.display_name, location: @customer_company.location, organization_id: @customer_company.organization_id, remarks: @customer_company.remarks, social_network_id: @customer_company.social_network_id, website: @customer_company.website } }, as: :json
    end

    assert_response 201
  end

  test "should show customer_company" do
    get customer_company_url(@customer_company), as: :json
    assert_response :success
  end

  test "should update customer_company" do
    patch customer_company_url(@customer_company), params: { customer_company: { address_id: @customer_company.address_id, company_code: @customer_company.company_code, company_name: @customer_company.company_name, contact_id: @customer_company.contact_id, customer_companycol: @customer_company.customer_companycol, display_name: @customer_company.display_name, location: @customer_company.location, organization_id: @customer_company.organization_id, remarks: @customer_company.remarks, social_network_id: @customer_company.social_network_id, website: @customer_company.website } }, as: :json
    assert_response 200
  end

  test "should destroy customer_company" do
    assert_difference('CustomerCompany.count', -1) do
      delete customer_company_url(@customer_company), as: :json
    end

    assert_response 204
  end
end
