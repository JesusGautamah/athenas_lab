# frozen_string_literal: true

require "application_system_test_case"

class ChatNamesTest < ApplicationSystemTestCase
  setup do
    @chat_name = chat_names(:one)
  end

  test "visiting the index" do
    visit chat_names_url
    assert_selector "h1", text: "Chat names"
  end

  test "should create chat name" do
    visit chat_names_url
    click_on "New chat name"

    fill_in "Chat", with: @chat_name.chat_id
    fill_in "Name", with: @chat_name.name
    click_on "Create Chat name"

    assert_text "Chat name was successfully created"
    click_on "Back"
  end

  test "should update Chat name" do
    visit chat_name_url(@chat_name)
    click_on "Edit this chat name", match: :first

    fill_in "Chat", with: @chat_name.chat_id
    fill_in "Name", with: @chat_name.name
    click_on "Update Chat name"

    assert_text "Chat name was successfully updated"
    click_on "Back"
  end

  test "should destroy Chat name" do
    visit chat_name_url(@chat_name)
    click_on "Destroy this chat name", match: :first

    assert_text "Chat name was successfully destroyed"
  end
end
