require 'test_helper'

class EstimateItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estimate_item = estimate_items(:one)
  end

  test "should get index" do
    get estimate_items_url, as: :json
    assert_response :success
  end

  test "should create estimate_item" do
    assert_difference('EstimateItem.count') do
      post estimate_items_url, params: { estimate_item: { cost_of_item: @estimate_item.cost_of_item, estimate_id: @estimate_item.estimate_id, item_id: @estimate_item.item_id, quantity: @estimate_item.quantity, remarks: @estimate_item.remarks } }, as: :json
    end

    assert_response 201
  end

  test "should show estimate_item" do
    get estimate_item_url(@estimate_item), as: :json
    assert_response :success
  end

  test "should update estimate_item" do
    patch estimate_item_url(@estimate_item), params: { estimate_item: { cost_of_item: @estimate_item.cost_of_item, estimate_id: @estimate_item.estimate_id, item_id: @estimate_item.item_id, quantity: @estimate_item.quantity, remarks: @estimate_item.remarks } }, as: :json
    assert_response 200
  end

  test "should destroy estimate_item" do
    assert_difference('EstimateItem.count', -1) do
      delete estimate_item_url(@estimate_item), as: :json
    end

    assert_response 204
  end
end
