# frozen_string_literal: true

require "test_helper"

class ChatNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chat_name = chat_names(:one)
  end

  test "should get index" do
    get chat_names_url
    assert_response :success
  end

  test "should get new" do
    get new_chat_name_url
    assert_response :success
  end

  test "should create chat_name" do
    assert_difference("ChatName.count") do
      post chat_names_url, params: { chat_name: { chat_id: @chat_name.chat_id, name: @chat_name.name } }
    end

    assert_redirected_to chat_name_url(ChatName.last)
  end

  test "should show chat_name" do
    get chat_name_url(@chat_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_chat_name_url(@chat_name)
    assert_response :success
  end

  test "should update chat_name" do
    patch chat_name_url(@chat_name), params: { chat_name: { chat_id: @chat_name.chat_id, name: @chat_name.name } }
    assert_redirected_to chat_name_url(@chat_name)
  end

  test "should destroy chat_name" do
    assert_difference("ChatName.count", -1) do
      delete chat_name_url(@chat_name)
    end

    assert_redirected_to chat_names_url
  end
end
