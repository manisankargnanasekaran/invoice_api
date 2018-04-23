require 'test_helper'

class OrganizationUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization_user = organization_users(:one)
  end

  test "should get index" do
    get organization_users_url, as: :json
    assert_response :success
  end

  test "should create organization_user" do
    assert_difference('OrganizationUser.count') do
      post organization_users_url, params: { organization_user: { address_id: @organization_user.address_id, contact_id: @organization_user.contact_id, deleted_at: @organization_user.deleted_at, department: @organization_user.department, first_name: @organization_user.first_name, gender: @organization_user.gender, is_primary: @organization_user.is_primary, last_name: @organization_user.last_name, organization_id: @organization_user.organization_id, organization_role_id: @organization_user.organization_role_id, salutation: @organization_user.salutation } }, as: :json
    end

    assert_response 201
  end

  test "should show organization_user" do
    get organization_user_url(@organization_user), as: :json
    assert_response :success
  end

  test "should update organization_user" do
    patch organization_user_url(@organization_user), params: { organization_user: { address_id: @organization_user.address_id, contact_id: @organization_user.contact_id, deleted_at: @organization_user.deleted_at, department: @organization_user.department, first_name: @organization_user.first_name, gender: @organization_user.gender, is_primary: @organization_user.is_primary, last_name: @organization_user.last_name, organization_id: @organization_user.organization_id, organization_role_id: @organization_user.organization_role_id, salutation: @organization_user.salutation } }, as: :json
    assert_response 200
  end

  test "should destroy organization_user" do
    assert_difference('OrganizationUser.count', -1) do
      delete organization_user_url(@organization_user), as: :json
    end

    assert_response 204
  end
end
