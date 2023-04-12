# frozen_string_literal: true

require "test_helper"

class ChatAdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chat_ad = chat_ads(:one)
  end

  test "should get index" do
    get chat_ads_url
    assert_response :success
  end

  test "should get new" do
    get new_chat_ad_url
    assert_response :success
  end

  test "should create chat_ad" do
    assert_difference("ChatAd.count") do
      post chat_ads_url, params: { chat_ad: { chat_id: @chat_ad.chat_id, content: @chat_ad.content, description: @chat_ad.description, title: @chat_ad.title } }
    end

    assert_redirected_to chat_ad_url(ChatAd.last)
  end

  test "should show chat_ad" do
    get chat_ad_url(@chat_ad)
    assert_response :success
  end

  test "should get edit" do
    get edit_chat_ad_url(@chat_ad)
    assert_response :success
  end

  test "should update chat_ad" do
    patch chat_ad_url(@chat_ad),
          params: { chat_ad: { chat_id: @chat_ad.chat_id, content: @chat_ad.content, description: @chat_ad.description, title: @chat_ad.title } }
    assert_redirected_to chat_ad_url(@chat_ad)
  end

  test "should destroy chat_ad" do
    assert_difference("ChatAd.count", -1) do
      delete chat_ad_url(@chat_ad)
    end

    assert_redirected_to chat_ads_url
  end
end
