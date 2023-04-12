# frozen_string_literal: true

require "application_system_test_case"

class ChatAnalyticsTest < ApplicationSystemTestCase
  setup do
    @chat_analytic = chat_analytics(:one)
  end

  test "visiting the index" do
    visit chat_analytics_url
    assert_selector "h1", text: "Chat analytics"
  end

  test "should create chat analytic" do
    visit chat_analytics_url
    click_on "New chat analytic"

    fill_in "Chat", with: @chat_analytic.chat_id
    fill_in "Description", with: @chat_analytic.description
    fill_in "Title", with: @chat_analytic.title
    click_on "Create Chat analytic"

    assert_text "Chat analytic was successfully created"
    click_on "Back"
  end

  test "should update Chat analytic" do
    visit chat_analytic_url(@chat_analytic)
    click_on "Edit this chat analytic", match: :first

    fill_in "Chat", with: @chat_analytic.chat_id
    fill_in "Description", with: @chat_analytic.description
    fill_in "Title", with: @chat_analytic.title
    click_on "Update Chat analytic"

    assert_text "Chat analytic was successfully updated"
    click_on "Back"
  end

  test "should destroy Chat analytic" do
    visit chat_analytic_url(@chat_analytic)
    click_on "Destroy this chat analytic", match: :first

    assert_text "Chat analytic was successfully destroyed"
  end
end
