# frozen_string_literal: true

require "application_system_test_case"

class MessageCorrectionsTest < ApplicationSystemTestCase
  setup do
    @message_correction = message_corrections(:one)
  end

  test "visiting the index" do
    visit message_corrections_url
    assert_selector "h1", text: "Message corrections"
  end

  test "should create message correction" do
    visit message_corrections_url
    click_on "New message correction"

    fill_in "Content", with: @message_correction.content
    fill_in "Message", with: @message_correction.message_id
    click_on "Create Message correction"

    assert_text "Message correction was successfully created"
    click_on "Back"
  end

  test "should update Message correction" do
    visit message_correction_url(@message_correction)
    click_on "Edit this message correction", match: :first

    fill_in "Content", with: @message_correction.content
    fill_in "Message", with: @message_correction.message_id
    click_on "Update Message correction"

    assert_text "Message correction was successfully updated"
    click_on "Back"
  end

  test "should destroy Message correction" do
    visit message_correction_url(@message_correction)
    click_on "Destroy this message correction", match: :first

    assert_text "Message correction was successfully destroyed"
  end
end
