# frozen_string_literal: true

require "test_helper"

class CodeExplanationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @code_explanation = code_explanations(:one)
  end

  test "should get index" do
    get code_explanations_url
    assert_response :success
  end

  test "should get new" do
    get new_code_explanation_url
    assert_response :success
  end

  test "should create code_explanation" do
    assert_difference("CodeExplanation.count") do
      post code_explanations_url,
           params: { code_explanation: { description: @code_explanation.description, message_id: @code_explanation.message_id,
                                         title: @code_explanation.title } }
    end

    assert_redirected_to code_explanation_url(CodeExplanation.last)
  end

  test "should show code_explanation" do
    get code_explanation_url(@code_explanation)
    assert_response :success
  end

  test "should get edit" do
    get edit_code_explanation_url(@code_explanation)
    assert_response :success
  end

  test "should update code_explanation" do
    patch code_explanation_url(@code_explanation),
          params: { code_explanation: { description: @code_explanation.description, message_id: @code_explanation.message_id, title: @code_explanation.title } }
    assert_redirected_to code_explanation_url(@code_explanation)
  end

  test "should destroy code_explanation" do
    assert_difference("CodeExplanation.count", -1) do
      delete code_explanation_url(@code_explanation)
    end

    assert_redirected_to code_explanations_url
  end
end
