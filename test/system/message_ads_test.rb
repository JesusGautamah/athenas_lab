# frozen_string_literal: true

require "application_system_test_case"

class MessageAdsTest < ApplicationSystemTestCase
  setup do
    @message_ad = message_ads(:one)
  end

  test "visiting the index" do
    visit message_ads_url
    assert_selector "h1", text: "Message ads"
  end

  test "should create message ad" do
    visit message_ads_url
    click_on "New message ad"

    fill_in "Content", with: @message_ad.content
    fill_in "Description", with: @message_ad.description
    fill_in "Message", with: @message_ad.message_id
    fill_in "Title", with: @message_ad.title
    click_on "Create Message ad"

    assert_text "Message ad was successfully created"
    click_on "Back"
  end

  test "should update Message ad" do
    visit message_ad_url(@message_ad)
    click_on "Edit this message ad", match: :first

    fill_in "Content", with: @message_ad.content
    fill_in "Description", with: @message_ad.description
    fill_in "Message", with: @message_ad.message_id
    fill_in "Title", with: @message_ad.title
    click_on "Update Message ad"

    assert_text "Message ad was successfully updated"
    click_on "Back"
  end

  test "should destroy Message ad" do
    visit message_ad_url(@message_ad)
    click_on "Destroy this message ad", match: :first

    assert_text "Message ad was successfully destroyed"
  end
end
