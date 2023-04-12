# frozen_string_literal: true

require "application_system_test_case"

class MessageRecomendationsTest < ApplicationSystemTestCase
  setup do
    @message_recomendation = message_recomendations(:one)
  end

  test "visiting the index" do
    visit message_recomendations_url
    assert_selector "h1", text: "Message recomendations"
  end

  test "should create message recomendation" do
    visit message_recomendations_url
    click_on "New message recomendation"

    fill_in "Content", with: @message_recomendation.content
    fill_in "Description", with: @message_recomendation.description
    fill_in "Message", with: @message_recomendation.message_id
    fill_in "Title", with: @message_recomendation.title
    click_on "Create Message recomendation"

    assert_text "Message recomendation was successfully created"
    click_on "Back"
  end

  test "should update Message recomendation" do
    visit message_recomendation_url(@message_recomendation)
    click_on "Edit this message recomendation", match: :first

    fill_in "Content", with: @message_recomendation.content
    fill_in "Description", with: @message_recomendation.description
    fill_in "Message", with: @message_recomendation.message_id
    fill_in "Title", with: @message_recomendation.title
    click_on "Update Message recomendation"

    assert_text "Message recomendation was successfully updated"
    click_on "Back"
  end

  test "should destroy Message recomendation" do
    visit message_recomendation_url(@message_recomendation)
    click_on "Destroy this message recomendation", match: :first

    assert_text "Message recomendation was successfully destroyed"
  end
end
