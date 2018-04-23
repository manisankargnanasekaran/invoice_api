require 'test_helper'

class OrganizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization = organizations(:one)
  end

  test "should get index" do
    get organizations_url, as: :json
    assert_response :success
  end

  test "should create organization" do
    assert_difference('Organization.count') do
      post organizations_url, params: { organization: { address_id: @organization.address_id, business_category_id: @organization.business_category_id, business_location: @organization.business_location, contact_id: @organization.contact_id, organization_logo: @organization.organization_logo, organization_name: @organization.organization_name, organization_website: @organization.organization_website, tenant_id: @organization.tenant_id } }, as: :json
    end

    assert_response 201
  end

  test "should show organization" do
    get organization_url(@organization), as: :json
    assert_response :success
  end

  test "should update organization" do
    patch organization_url(@organization), params: { organization: { address_id: @organization.address_id, business_category_id: @organization.business_category_id, business_location: @organization.business_location, contact_id: @organization.contact_id, organization_logo: @organization.organization_logo, organization_name: @organization.organization_name, organization_website: @organization.organization_website, tenant_id: @organization.tenant_id } }, as: :json
    assert_response 200
  end

  test "should destroy organization" do
    assert_difference('Organization.count', -1) do
      delete organization_url(@organization), as: :json
    end

    assert_response 204
  end
end
