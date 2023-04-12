# frozen_string_literal: true

require "application_system_test_case"

class MessageIdeasTest < ApplicationSystemTestCase
  setup do
    @message_idea = message_ideas(:one)
  end

  test "visiting the index" do
    visit message_ideas_url
    assert_selector "h1", text: "Message ideas"
  end

  test "should create message idea" do
    visit message_ideas_url
    click_on "New message idea"

    fill_in "Content", with: @message_idea.content
    fill_in "Description", with: @message_idea.description
    fill_in "Message", with: @message_idea.message_id
    fill_in "Title", with: @message_idea.title
    click_on "Create Message idea"

    assert_text "Message idea was successfully created"
    click_on "Back"
  end

  test "should update Message idea" do
    visit message_idea_url(@message_idea)
    click_on "Edit this message idea", match: :first

    fill_in "Content", with: @message_idea.content
    fill_in "Description", with: @message_idea.description
    fill_in "Message", with: @message_idea.message_id
    fill_in "Title", with: @message_idea.title
    click_on "Update Message idea"

    assert_text "Message idea was successfully updated"
    click_on "Back"
  end

  test "should destroy Message idea" do
    visit message_idea_url(@message_idea)
    click_on "Destroy this message idea", match: :first

    assert_text "Message idea was successfully destroyed"
  end
end
