# frozen_string_literal: true

require "application_system_test_case"

class ChatIdeasTest < ApplicationSystemTestCase
  setup do
    @chat_idea = chat_ideas(:one)
  end

  test "visiting the index" do
    visit chat_ideas_url
    assert_selector "h1", text: "Chat ideas"
  end

  test "should create chat idea" do
    visit chat_ideas_url
    click_on "New chat idea"

    fill_in "Chat", with: @chat_idea.chat_id
    fill_in "Content", with: @chat_idea.content
    fill_in "Description", with: @chat_idea.description
    fill_in "Title", with: @chat_idea.title
    click_on "Create Chat idea"

    assert_text "Chat idea was successfully created"
    click_on "Back"
  end

  test "should update Chat idea" do
    visit chat_idea_url(@chat_idea)
    click_on "Edit this chat idea", match: :first

    fill_in "Chat", with: @chat_idea.chat_id
    fill_in "Content", with: @chat_idea.content
    fill_in "Description", with: @chat_idea.description
    fill_in "Title", with: @chat_idea.title
    click_on "Update Chat idea"

    assert_text "Chat idea was successfully updated"
    click_on "Back"
  end

  test "should destroy Chat idea" do
    visit chat_idea_url(@chat_idea)
    click_on "Destroy this chat idea", match: :first

    assert_text "Chat idea was successfully destroyed"
  end
end
