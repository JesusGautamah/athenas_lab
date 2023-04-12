# frozen_string_literal: true

require "test_helper"

class ChatRecomendationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chat_recomendation = chat_recomendations(:one)
  end

  test "should get index" do
    get chat_recomendations_url
    assert_response :success
  end

  test "should get new" do
    get new_chat_recomendation_url
    assert_response :success
  end

  test "should create chat_recomendation" do
    assert_difference("ChatRecomendation.count") do
      post chat_recomendations_url,
           params: { chat_recomendation: { chat_id: @chat_recomendation.chat_id, content: @chat_recomendation.content, description: @chat_recomendation.description,
                                           title: @chat_recomendation.title } }
    end

    assert_redirected_to chat_recomendation_url(ChatRecomendation.last)
  end

  test "should show chat_recomendation" do
    get chat_recomendation_url(@chat_recomendation)
    assert_response :success
  end

  test "should get edit" do
    get edit_chat_recomendation_url(@chat_recomendation)
    assert_response :success
  end

  test "should update chat_recomendation" do
    patch chat_recomendation_url(@chat_recomendation),
          params: { chat_recomendation: { chat_id: @chat_recomendation.chat_id, content: @chat_recomendation.content, description: @chat_recomendation.description,
                                          title: @chat_recomendation.title } }
    assert_redirected_to chat_recomendation_url(@chat_recomendation)
  end

  test "should destroy chat_recomendation" do
    assert_difference("ChatRecomendation.count", -1) do
      delete chat_recomendation_url(@chat_recomendation)
    end

    assert_redirected_to chat_recomendations_url
  end
end
