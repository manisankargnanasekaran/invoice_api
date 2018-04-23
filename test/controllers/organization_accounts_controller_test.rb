require 'test_helper'

class OrganizationAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization_account = organization_accounts(:one)
  end

  test "should get index" do
    get organization_accounts_url, as: :json
    assert_response :success
  end

  test "should create organization_account" do
    assert_difference('OrganizationAccount.count') do
      post organization_accounts_url, params: { organization_account: { currency_code: @organization_account.currency_code, currency_symbol: @organization_account.currency_symbol, fiscal_year_start_month: @organization_account.fiscal_year_start_month, organization_id: @organization_account.organization_id } }, as: :json
    end

    assert_response 201
  end

  test "should show organization_account" do
    get organization_account_url(@organization_account), as: :json
    assert_response :success
  end

  test "should update organization_account" do
    patch organization_account_url(@organization_account), params: { organization_account: { currency_code: @organization_account.currency_code, currency_symbol: @organization_account.currency_symbol, fiscal_year_start_month: @organization_account.fiscal_year_start_month, organization_id: @organization_account.organization_id } }, as: :json
    assert_response 200
  end

  test "should destroy organization_account" do
    assert_difference('OrganizationAccount.count', -1) do
      delete organization_account_url(@organization_account), as: :json
    end

    assert_response 204
  end
end
