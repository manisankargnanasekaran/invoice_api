require 'test_helper'

class GstTreatmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gst_treatment = gst_treatments(:one)
  end

  test "should get index" do
    get gst_treatments_url, as: :json
    assert_response :success
  end

  test "should create gst_treatment" do
    assert_difference('GstTreatment.count') do
      post gst_treatments_url, params: { gst_treatment: { description: @gst_treatment.description, name: @gst_treatment.name } }, as: :json
    end

    assert_response 201
  end

  test "should show gst_treatment" do
    get gst_treatment_url(@gst_treatment), as: :json
    assert_response :success
  end

  test "should update gst_treatment" do
    patch gst_treatment_url(@gst_treatment), params: { gst_treatment: { description: @gst_treatment.description, name: @gst_treatment.name } }, as: :json
    assert_response 200
  end

  test "should destroy gst_treatment" do
    assert_difference('GstTreatment.count', -1) do
      delete gst_treatment_url(@gst_treatment), as: :json
    end

    assert_response 204
  end
end
