# frozen_string_literal: true

require "test_helper"

class ChatSummariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chat_summary = chat_summaries(:one)
  end

  test "should get index" do
    get chat_summaries_url
    assert_response :success
  end

  test "should get new" do
    get new_chat_summary_url
    assert_response :success
  end

  test "should create chat_summary" do
    assert_difference("ChatSummary.count") do
      post chat_summaries_url,
           params: { chat_summary: { chat_id: @chat_summary.chat_id, content: @chat_summary.content, description: @chat_summary.description,
                                     title: @chat_summary.title } }
    end

    assert_redirected_to chat_summary_url(ChatSummary.last)
  end

  test "should show chat_summary" do
    get chat_summary_url(@chat_summary)
    assert_response :success
  end

  test "should get edit" do
    get edit_chat_summary_url(@chat_summary)
    assert_response :success
  end

  test "should update chat_summary" do
    patch chat_summary_url(@chat_summary),
          params: { chat_summary: { chat_id: @chat_summary.chat_id, content: @chat_summary.content, description: @chat_summary.description,
                                    title: @chat_summary.title } }
    assert_redirected_to chat_summary_url(@chat_summary)
  end

  test "should destroy chat_summary" do
    assert_difference("ChatSummary.count", -1) do
      delete chat_summary_url(@chat_summary)
    end

    assert_redirected_to chat_summaries_url
  end
end
