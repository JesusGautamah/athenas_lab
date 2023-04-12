# frozen_string_literal: true

require "test_helper"

class MessageRecomendationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_recomendation = message_recomendations(:one)
  end

  test "should get index" do
    get message_recomendations_url
    assert_response :success
  end

  test "should get new" do
    get new_message_recomendation_url
    assert_response :success
  end

  test "should create message_recomendation" do
    assert_difference("MessageRecomendation.count") do
      post message_recomendations_url,
           params: { message_recomendation: { content: @message_recomendation.content, description: @message_recomendation.description,
                                              message_id: @message_recomendation.message_id, title: @message_recomendation.title } }
    end

    assert_redirected_to message_recomendation_url(MessageRecomendation.last)
  end

  test "should show message_recomendation" do
    get message_recomendation_url(@message_recomendation)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_recomendation_url(@message_recomendation)
    assert_response :success
  end

  test "should update message_recomendation" do
    patch message_recomendation_url(@message_recomendation),
          params: { message_recomendation: { content: @message_recomendation.content, description: @message_recomendation.description,
                                             message_id: @message_recomendation.message_id, title: @message_recomendation.title } }
    assert_redirected_to message_recomendation_url(@message_recomendation)
  end

  test "should destroy message_recomendation" do
    assert_difference("MessageRecomendation.count", -1) do
      delete message_recomendation_url(@message_recomendation)
    end

    assert_redirected_to message_recomendations_url
  end
end
