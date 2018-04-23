require 'test_helper'

class BusinessCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @business_category = business_categories(:one)
  end

  test "should get index" do
    get business_categories_url, as: :json
    assert_response :success
  end

  test "should create business_category" do
    assert_difference('BusinessCategory.count') do
      post business_categories_url, params: { business_category: { business_category_code: @business_category.business_category_code, business_category_name: @business_category.business_category_name } }, as: :json
    end

    assert_response 201
  end

  test "should show business_category" do
    get business_category_url(@business_category), as: :json
    assert_response :success
  end

  test "should update business_category" do
    patch business_category_url(@business_category), params: { business_category: { business_category_code: @business_category.business_category_code, business_category_name: @business_category.business_category_name } }, as: :json
    assert_response 200
  end

  test "should destroy business_category" do
    assert_difference('BusinessCategory.count', -1) do
      delete business_category_url(@business_category), as: :json
    end

    assert_response 204
  end
end
