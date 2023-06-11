# frozen_string_literal: true

require "application_system_test_case"

class ProjectChatsTest < ApplicationSystemTestCase
  setup do
    @project_chat = project_chats(:one)
  end

  test "visiting the index" do
    visit project_chats_url
    assert_selector "h1", text: "Project chats"
  end

  test "should create project chat" do
    visit project_chats_url
    click_on "New project chat"

    fill_in "Board project", with: @project_chat.board_project_id
    fill_in "Chat", with: @project_chat.chat_id
    fill_in "Function title", with: @project_chat.function_title
    click_on "Create Project chat"

    assert_text "Project chat was successfully created"
    click_on "Back"
  end

  test "should update Project chat" do
    visit project_chat_url(@project_chat)
    click_on "Edit this project chat", match: :first

    fill_in "Board project", with: @project_chat.board_project_id
    fill_in "Chat", with: @project_chat.chat_id
    fill_in "Function title", with: @project_chat.function_title
    click_on "Update Project chat"

    assert_text "Project chat was successfully updated"
    click_on "Back"
  end

  test "should destroy Project chat" do
    visit project_chat_url(@project_chat)
    click_on "Destroy this project chat", match: :first

    assert_text "Project chat was successfully destroyed"
  end
end
