# frozen_string_literal: true

require "test_helper"

class ProjectChatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_chat = project_chats(:one)
  end

  test "should get index" do
    get project_chats_url
    assert_response :success
  end

  test "should get new" do
    get new_project_chat_url
    assert_response :success
  end

  test "should create project_chat" do
    assert_difference("ProjectChat.count") do
      post project_chats_url, params: { project_chat: { board_project_id: @project_chat.board_project_id, chat_id: @project_chat.chat_id, function_title: @project_chat.function_title } }
    end

    assert_redirected_to project_chat_url(ProjectChat.last)
  end

  test "should show project_chat" do
    get project_chat_url(@project_chat)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_chat_url(@project_chat)
    assert_response :success
  end

  test "should update project_chat" do
    patch project_chat_url(@project_chat), params: { project_chat: { board_project_id: @project_chat.board_project_id, chat_id: @project_chat.chat_id, function_title: @project_chat.function_title } }
    assert_redirected_to project_chat_url(@project_chat)
  end

  test "should destroy project_chat" do
    assert_difference("ProjectChat.count", -1) do
      delete project_chat_url(@project_chat)
    end

    assert_redirected_to project_chats_url
  end
end
