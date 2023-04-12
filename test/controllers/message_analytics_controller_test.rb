# frozen_string_literal: true

require "test_helper"

class MessageAnalyticsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_analytic = message_analytics(:one)
  end

  test "should get index" do
    get message_analytics_url
    assert_response :success
  end

  test "should get new" do
    get new_message_analytic_url
    assert_response :success
  end

  test "should create message_analytic" do
    assert_difference("MessageAnalytic.count") do
      post message_analytics_url,
           params: { message_analytic: { description: @message_analytic.description, message_id: @message_analytic.message_id,
                                         title: @message_analytic.title } }
    end

    assert_redirected_to message_analytic_url(MessageAnalytic.last)
  end

  test "should show message_analytic" do
    get message_analytic_url(@message_analytic)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_analytic_url(@message_analytic)
    assert_response :success
  end

  test "should update message_analytic" do
    patch message_analytic_url(@message_analytic),
          params: { message_analytic: { description: @message_analytic.description, message_id: @message_analytic.message_id, title: @message_analytic.title } }
    assert_redirected_to message_analytic_url(@message_analytic)
  end

  test "should destroy message_analytic" do
    assert_difference("MessageAnalytic.count", -1) do
      delete message_analytic_url(@message_analytic)
    end

    assert_redirected_to message_analytics_url
  end
end
