# frozen_string_literal: true

require "test_helper"

class MessageCorrectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_correction = message_corrections(:one)
  end

  test "should get index" do
    get message_corrections_url
    assert_response :success
  end

  test "should get new" do
    get new_message_correction_url
    assert_response :success
  end

  test "should create message_correction" do
    assert_difference("MessageCorrection.count") do
      post message_corrections_url, params: { message_correction: { content: @message_correction.content, message_id: @message_correction.message_id } }
    end

    assert_redirected_to message_correction_url(MessageCorrection.last)
  end

  test "should show message_correction" do
    get message_correction_url(@message_correction)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_correction_url(@message_correction)
    assert_response :success
  end

  test "should update message_correction" do
    patch message_correction_url(@message_correction),
          params: { message_correction: { content: @message_correction.content, message_id: @message_correction.message_id } }
    assert_redirected_to message_correction_url(@message_correction)
  end

  test "should destroy message_correction" do
    assert_difference("MessageCorrection.count", -1) do
      delete message_correction_url(@message_correction)
    end

    assert_redirected_to message_corrections_url
  end
end
