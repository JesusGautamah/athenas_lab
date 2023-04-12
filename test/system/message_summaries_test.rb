# frozen_string_literal: true

require "application_system_test_case"

class MessageSummariesTest < ApplicationSystemTestCase
  setup do
    @message_summary = message_summaries(:one)
  end

  test "visiting the index" do
    visit message_summaries_url
    assert_selector "h1", text: "Message summaries"
  end

  test "should create message summary" do
    visit message_summaries_url
    click_on "New message summary"

    fill_in "Content", with: @message_summary.content
    fill_in "Description", with: @message_summary.description
    fill_in "Message", with: @message_summary.message_id
    fill_in "Title", with: @message_summary.title
    click_on "Create Message summary"

    assert_text "Message summary was successfully created"
    click_on "Back"
  end

  test "should update Message summary" do
    visit message_summary_url(@message_summary)
    click_on "Edit this message summary", match: :first

    fill_in "Content", with: @message_summary.content
    fill_in "Description", with: @message_summary.description
    fill_in "Message", with: @message_summary.message_id
    fill_in "Title", with: @message_summary.title
    click_on "Update Message summary"

    assert_text "Message summary was successfully updated"
    click_on "Back"
  end

  test "should destroy Message summary" do
    visit message_summary_url(@message_summary)
    click_on "Destroy this message summary", match: :first

    assert_text "Message summary was successfully destroyed"
  end
end
