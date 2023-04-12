# frozen_string_literal: true

require "test_helper"

class MessageSummariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_summary = message_summaries(:one)
  end

  test "should get index" do
    get message_summaries_url
    assert_response :success
  end

  test "should get new" do
    get new_message_summary_url
    assert_response :success
  end

  test "should create message_summary" do
    assert_difference("MessageSummary.count") do
      post message_summaries_url,
           params: { message_summary: { content: @message_summary.content, description: @message_summary.description, message_id: @message_summary.message_id,
                                        title: @message_summary.title } }
    end

    assert_redirected_to message_summary_url(MessageSummary.last)
  end

  test "should show message_summary" do
    get message_summary_url(@message_summary)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_summary_url(@message_summary)
    assert_response :success
  end

  test "should update message_summary" do
    patch message_summary_url(@message_summary),
          params: { message_summary: { content: @message_summary.content, description: @message_summary.description, message_id: @message_summary.message_id,
                                       title: @message_summary.title } }
    assert_redirected_to message_summary_url(@message_summary)
  end

  test "should destroy message_summary" do
    assert_difference("MessageSummary.count", -1) do
      delete message_summary_url(@message_summary)
    end

    assert_redirected_to message_summaries_url
  end
end
