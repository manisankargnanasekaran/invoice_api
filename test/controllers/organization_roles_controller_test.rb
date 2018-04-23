require 'test_helper'

class OrganizationRolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization_role = organization_roles(:one)
  end

  test "should get index" do
    get organization_roles_url, as: :json
    assert_response :success
  end

  test "should create organization_role" do
    assert_difference('OrganizationRole.count') do
      post organization_roles_url, params: { organization_role: { department: @organization_role.department, organization_id: @organization_role.organization_id, role_code: @organization_role.role_code, role_name: @organization_role.role_name } }, as: :json
    end

    assert_response 201
  end

  test "should show organization_role" do
    get organization_role_url(@organization_role), as: :json
    assert_response :success
  end

  test "should update organization_role" do
    patch organization_role_url(@organization_role), params: { organization_role: { department: @organization_role.department, organization_id: @organization_role.organization_id, role_code: @organization_role.role_code, role_name: @organization_role.role_name } }, as: :json
    assert_response 200
  end

  test "should destroy organization_role" do
    assert_difference('OrganizationRole.count', -1) do
      delete organization_role_url(@organization_role), as: :json
    end

    assert_response 204
  end
end
