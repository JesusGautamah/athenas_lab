# frozen_string_literal: true

require "test_helper"

class MessageIdeasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_idea = message_ideas(:one)
  end

  test "should get index" do
    get message_ideas_url
    assert_response :success
  end

  test "should get new" do
    get new_message_idea_url
    assert_response :success
  end

  test "should create message_idea" do
    assert_difference("MessageIdea.count") do
      post message_ideas_url,
           params: { message_idea: { content: @message_idea.content, description: @message_idea.description, message_id: @message_idea.message_id,
                                     title: @message_idea.title } }
    end

    assert_redirected_to message_idea_url(MessageIdea.last)
  end

  test "should show message_idea" do
    get message_idea_url(@message_idea)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_idea_url(@message_idea)
    assert_response :success
  end

  test "should update message_idea" do
    patch message_idea_url(@message_idea),
          params: { message_idea: { content: @message_idea.content, description: @message_idea.description, message_id: @message_idea.message_id,
                                    title: @message_idea.title } }
    assert_redirected_to message_idea_url(@message_idea)
  end

  test "should destroy message_idea" do
    assert_difference("MessageIdea.count", -1) do
      delete message_idea_url(@message_idea)
    end

    assert_redirected_to message_ideas_url
  end
end
