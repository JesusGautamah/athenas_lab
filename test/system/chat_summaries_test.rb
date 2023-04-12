# frozen_string_literal: true

require "application_system_test_case"

class ChatSummariesTest < ApplicationSystemTestCase
  setup do
    @chat_summary = chat_summaries(:one)
  end

  test "visiting the index" do
    visit chat_summaries_url
    assert_selector "h1", text: "Chat summaries"
  end

  test "should create chat summary" do
    visit chat_summaries_url
    click_on "New chat summary"

    fill_in "Chat", with: @chat_summary.chat_id
    fill_in "Content", with: @chat_summary.content
    fill_in "Description", with: @chat_summary.description
    fill_in "Title", with: @chat_summary.title
    click_on "Create Chat summary"

    assert_text "Chat summary was successfully created"
    click_on "Back"
  end

  test "should update Chat summary" do
    visit chat_summary_url(@chat_summary)
    click_on "Edit this chat summary", match: :first

    fill_in "Chat", with: @chat_summary.chat_id
    fill_in "Content", with: @chat_summary.content
    fill_in "Description", with: @chat_summary.description
    fill_in "Title", with: @chat_summary.title
    click_on "Update Chat summary"

    assert_text "Chat summary was successfully updated"
    click_on "Back"
  end

  test "should destroy Chat summary" do
    visit chat_summary_url(@chat_summary)
    click_on "Destroy this chat summary", match: :first

    assert_text "Chat summary was successfully destroyed"
  end
end
