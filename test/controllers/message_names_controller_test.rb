# frozen_string_literal: true

require "test_helper"

class MessageNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_name = message_names(:one)
  end

  test "should get index" do
    get message_names_url
    assert_response :success
  end

  test "should get new" do
    get new_message_name_url
    assert_response :success
  end

  test "should create message_name" do
    assert_difference("MessageName.count") do
      post message_names_url, params: { message_name: { message_id: @message_name.message_id, name: @message_name.name } }
    end

    assert_redirected_to message_name_url(MessageName.last)
  end

  test "should show message_name" do
    get message_name_url(@message_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_name_url(@message_name)
    assert_response :success
  end

  test "should update message_name" do
    patch message_name_url(@message_name), params: { message_name: { message_id: @message_name.message_id, name: @message_name.name } }
    assert_redirected_to message_name_url(@message_name)
  end

  test "should destroy message_name" do
    assert_difference("MessageName.count", -1) do
      delete message_name_url(@message_name)
    end

    assert_redirected_to message_names_url
  end
end
