require 'test_helper'

class UserLoginDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_login_detail = user_login_details(:one)
  end

  test "should get index" do
    get user_login_details_url, as: :json
    assert_response :success
  end

  test "should create user_login_detail" do
    assert_difference('UserLoginDetail.count') do
      post user_login_details_url, params: { user_login_detail: { deleted_at: @user_login_detail.deleted_at, email: @user_login_detail.email, organization_user_id: @user_login_detail.organization_user_id, password: @user_login_detail.password } }, as: :json
    end

    assert_response 201
  end

  test "should show user_login_detail" do
    get user_login_detail_url(@user_login_detail), as: :json
    assert_response :success
  end

  test "should update user_login_detail" do
    patch user_login_detail_url(@user_login_detail), params: { user_login_detail: { deleted_at: @user_login_detail.deleted_at, email: @user_login_detail.email, organization_user_id: @user_login_detail.organization_user_id, password: @user_login_detail.password } }, as: :json
    assert_response 200
  end

  test "should destroy user_login_detail" do
    assert_difference('UserLoginDetail.count', -1) do
      delete user_login_detail_url(@user_login_detail), as: :json
    end

    assert_response 204
  end
end
