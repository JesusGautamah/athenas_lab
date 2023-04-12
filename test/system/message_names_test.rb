# frozen_string_literal: true

require "application_system_test_case"

class MessageNamesTest < ApplicationSystemTestCase
  setup do
    @message_name = message_names(:one)
  end

  test "visiting the index" do
    visit message_names_url
    assert_selector "h1", text: "Message names"
  end

  test "should create message name" do
    visit message_names_url
    click_on "New message name"

    fill_in "Message", with: @message_name.message_id
    fill_in "Name", with: @message_name.name
    click_on "Create Message name"

    assert_text "Message name was successfully created"
    click_on "Back"
  end

  test "should update Message name" do
    visit message_name_url(@message_name)
    click_on "Edit this message name", match: :first

    fill_in "Message", with: @message_name.message_id
    fill_in "Name", with: @message_name.name
    click_on "Update Message name"

    assert_text "Message name was successfully updated"
    click_on "Back"
  end

  test "should destroy Message name" do
    visit message_name_url(@message_name)
    click_on "Destroy this message name", match: :first

    assert_text "Message name was successfully destroyed"
  end
end
