require 'test_helper'

class CustomerAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_account = customer_accounts(:one)
  end

  test "should get index" do
    get customer_accounts_url, as: :json
    assert_response :success
  end

  test "should create customer_account" do
    assert_difference('CustomerAccount.count') do
      post customer_accounts_url, params: { customer_account: { billing_address: @customer_account.billing_address, currency: @customer_account.currency, customer_company_id: @customer_account.customer_company_id, gst_no: @customer_account.gst_no, gst_treatment_id: @customer_account.gst_treatment_id, pan: @customer_account.pan, payment_terms: @customer_account.payment_terms, place_of_supply: @customer_account.place_of_supply, shipping_address: @customer_account.shipping_address, tan: @customer_account.tan, tax_exempt_reason: @customer_account.tax_exempt_reason, taxable: @customer_account.taxable, tin: @customer_account.tin } }, as: :json
    end

    assert_response 201
  end

  test "should show customer_account" do
    get customer_account_url(@customer_account), as: :json
    assert_response :success
  end

  test "should update customer_account" do
    patch customer_account_url(@customer_account), params: { customer_account: { billing_address: @customer_account.billing_address, currency: @customer_account.currency, customer_company_id: @customer_account.customer_company_id, gst_no: @customer_account.gst_no, gst_treatment_id: @customer_account.gst_treatment_id, pan: @customer_account.pan, payment_terms: @customer_account.payment_terms, place_of_supply: @customer_account.place_of_supply, shipping_address: @customer_account.shipping_address, tan: @customer_account.tan, tax_exempt_reason: @customer_account.tax_exempt_reason, taxable: @customer_account.taxable, tin: @customer_account.tin } }, as: :json
    assert_response 200
  end

  test "should destroy customer_account" do
    assert_difference('CustomerAccount.count', -1) do
      delete customer_account_url(@customer_account), as: :json
    end

    assert_response 204
  end
end
