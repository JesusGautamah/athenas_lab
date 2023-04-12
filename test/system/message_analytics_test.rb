# frozen_string_literal: true

require "application_system_test_case"

class MessageAnalyticsTest < ApplicationSystemTestCase
  setup do
    @message_analytic = message_analytics(:one)
  end

  test "visiting the index" do
    visit message_analytics_url
    assert_selector "h1", text: "Message analytics"
  end

  test "should create message analytic" do
    visit message_analytics_url
    click_on "New message analytic"

    fill_in "Description", with: @message_analytic.description
    fill_in "Message", with: @message_analytic.message_id
    fill_in "Title", with: @message_analytic.title
    click_on "Create Message analytic"

    assert_text "Message analytic was successfully created"
    click_on "Back"
  end

  test "should update Message analytic" do
    visit message_analytic_url(@message_analytic)
    click_on "Edit this message analytic", match: :first

    fill_in "Description", with: @message_analytic.description
    fill_in "Message", with: @message_analytic.message_id
    fill_in "Title", with: @message_analytic.title
    click_on "Update Message analytic"

    assert_text "Message analytic was successfully updated"
    click_on "Back"
  end

  test "should destroy Message analytic" do
    visit message_analytic_url(@message_analytic)
    click_on "Destroy this message analytic", match: :first

    assert_text "Message analytic was successfully destroyed"
  end
end
