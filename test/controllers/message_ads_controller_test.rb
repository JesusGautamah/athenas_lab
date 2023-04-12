# frozen_string_literal: true

require "test_helper"

class MessageAdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_ad = message_ads(:one)
  end

  test "should get index" do
    get message_ads_url
    assert_response :success
  end

  test "should get new" do
    get new_message_ad_url
    assert_response :success
  end

  test "should create message_ad" do
    assert_difference("MessageAd.count") do
      post message_ads_url,
           params: { message_ad: { content: @message_ad.content, description: @message_ad.description, message_id: @message_ad.message_id,
                                   title: @message_ad.title } }
    end

    assert_redirected_to message_ad_url(MessageAd.last)
  end

  test "should show message_ad" do
    get message_ad_url(@message_ad)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_ad_url(@message_ad)
    assert_response :success
  end

  test "should update message_ad" do
    patch message_ad_url(@message_ad),
          params: { message_ad: { content: @message_ad.content, description: @message_ad.description, message_id: @message_ad.message_id,
                                  title: @message_ad.title } }
    assert_redirected_to message_ad_url(@message_ad)
  end

  test "should destroy message_ad" do
    assert_difference("MessageAd.count", -1) do
      delete message_ad_url(@message_ad)
    end

    assert_redirected_to message_ads_url
  end
end
