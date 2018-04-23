require 'test_helper'

class EstimatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estimate = estimates(:one)
  end

  test "should get index" do
    get estimates_url, as: :json
    assert_response :success
  end

  test "should create estimate" do
    assert_difference('Estimate.count') do
      post estimates_url, params: { estimate: { customer_company_id: @estimate.customer_company_id, customer_contact_persion_id: @estimate.customer_contact_persion_id, date_of_estimete: @estimate.date_of_estimete, discount_name: @estimate.discount_name, discount_percentage: @estimate.discount_percentage, estimate_status: @estimate.estimate_status, estimete_number: @estimate.estimete_number, expiry_date: @estimate.expiry_date, message: @estimate.message, name_of_estimate: @estimate.name_of_estimate, organization_id: @estimate.organization_id, organization_user_id: @estimate.organization_user_id, remarks: @estimate.remarks, terms_and_condition: @estimate.terms_and_condition } }, as: :json
    end

    assert_response 201
  end

  test "should show estimate" do
    get estimate_url(@estimate), as: :json
    assert_response :success
  end

  test "should update estimate" do
    patch estimate_url(@estimate), params: { estimate: { customer_company_id: @estimate.customer_company_id, customer_contact_persion_id: @estimate.customer_contact_persion_id, date_of_estimete: @estimate.date_of_estimete, discount_name: @estimate.discount_name, discount_percentage: @estimate.discount_percentage, estimate_status: @estimate.estimate_status, estimete_number: @estimate.estimete_number, expiry_date: @estimate.expiry_date, message: @estimate.message, name_of_estimate: @estimate.name_of_estimate, organization_id: @estimate.organization_id, organization_user_id: @estimate.organization_user_id, remarks: @estimate.remarks, terms_and_condition: @estimate.terms_and_condition } }, as: :json
    assert_response 200
  end

  test "should destroy estimate" do
    assert_difference('Estimate.count', -1) do
      delete estimate_url(@estimate), as: :json
    end

    assert_response 204
  end
end
