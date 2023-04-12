# frozen_string_literal: true

require "application_system_test_case"

class ChatAdsTest < ApplicationSystemTestCase
  setup do
    @chat_ad = chat_ads(:one)
  end

  test "visiting the index" do
    visit chat_ads_url
    assert_selector "h1", text: "Chat ads"
  end

  test "should create chat ad" do
    visit chat_ads_url
    click_on "New chat ad"

    fill_in "Chat", with: @chat_ad.chat_id
    fill_in "Content", with: @chat_ad.content
    fill_in "Description", with: @chat_ad.description
    fill_in "Title", with: @chat_ad.title
    click_on "Create Chat ad"

    assert_text "Chat ad was successfully created"
    click_on "Back"
  end

  test "should update Chat ad" do
    visit chat_ad_url(@chat_ad)
    click_on "Edit this chat ad", match: :first

    fill_in "Chat", with: @chat_ad.chat_id
    fill_in "Content", with: @chat_ad.content
    fill_in "Description", with: @chat_ad.description
    fill_in "Title", with: @chat_ad.title
    click_on "Update Chat ad"

    assert_text "Chat ad was successfully updated"
    click_on "Back"
  end

  test "should destroy Chat ad" do
    visit chat_ad_url(@chat_ad)
    click_on "Destroy this chat ad", match: :first

    assert_text "Chat ad was successfully destroyed"
  end
end
