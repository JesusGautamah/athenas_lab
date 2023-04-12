# frozen_string_literal: true

require "test_helper"

class ChatIdeasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chat_idea = chat_ideas(:one)
  end

  test "should get index" do
    get chat_ideas_url
    assert_response :success
  end

  test "should get new" do
    get new_chat_idea_url
    assert_response :success
  end

  test "should create chat_idea" do
    assert_difference("ChatIdea.count") do
      post chat_ideas_url,
           params: { chat_idea: { chat_id: @chat_idea.chat_id, content: @chat_idea.content, description: @chat_idea.description, title: @chat_idea.title } }
    end

    assert_redirected_to chat_idea_url(ChatIdea.last)
  end

  test "should show chat_idea" do
    get chat_idea_url(@chat_idea)
    assert_response :success
  end

  test "should get edit" do
    get edit_chat_idea_url(@chat_idea)
    assert_response :success
  end

  test "should update chat_idea" do
    patch chat_idea_url(@chat_idea),
          params: { chat_idea: { chat_id: @chat_idea.chat_id, content: @chat_idea.content, description: @chat_idea.description, title: @chat_idea.title } }
    assert_redirected_to chat_idea_url(@chat_idea)
  end

  test "should destroy chat_idea" do
    assert_difference("ChatIdea.count", -1) do
      delete chat_idea_url(@chat_idea)
    end

    assert_redirected_to chat_ideas_url
  end
end
