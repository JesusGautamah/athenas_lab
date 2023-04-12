# frozen_string_literal: true

require "test_helper"

class ChatAnalyticsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chat_analytic = chat_analytics(:one)
  end

  test "should get index" do
    get chat_analytics_url
    assert_response :success
  end

  test "should get new" do
    get new_chat_analytic_url
    assert_response :success
  end

  test "should create chat_analytic" do
    assert_difference("ChatAnalytic.count") do
      post chat_analytics_url,
           params: { chat_analytic: { chat_id: @chat_analytic.chat_id, description: @chat_analytic.description, title: @chat_analytic.title } }
    end

    assert_redirected_to chat_analytic_url(ChatAnalytic.last)
  end

  test "should show chat_analytic" do
    get chat_analytic_url(@chat_analytic)
    assert_response :success
  end

  test "should get edit" do
    get edit_chat_analytic_url(@chat_analytic)
    assert_response :success
  end

  test "should update chat_analytic" do
    patch chat_analytic_url(@chat_analytic),
          params: { chat_analytic: { chat_id: @chat_analytic.chat_id, description: @chat_analytic.description, title: @chat_analytic.title } }
    assert_redirected_to chat_analytic_url(@chat_analytic)
  end

  test "should destroy chat_analytic" do
    assert_difference("ChatAnalytic.count", -1) do
      delete chat_analytic_url(@chat_analytic)
    end

    assert_redirected_to chat_analytics_url
  end
end
