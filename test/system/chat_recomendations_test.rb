# frozen_string_literal: true

require "application_system_test_case"

class ChatRecomendationsTest < ApplicationSystemTestCase
  setup do
    @chat_recomendation = chat_recomendations(:one)
  end

  test "visiting the index" do
    visit chat_recomendations_url
    assert_selector "h1", text: "Chat recomendations"
  end

  test "should create chat recomendation" do
    visit chat_recomendations_url
    click_on "New chat recomendation"

    fill_in "Chat", with: @chat_recomendation.chat_id
    fill_in "Content", with: @chat_recomendation.content
    fill_in "Description", with: @chat_recomendation.description
    fill_in "Title", with: @chat_recomendation.title
    click_on "Create Chat recomendation"

    assert_text "Chat recomendation was successfully created"
    click_on "Back"
  end

  test "should update Chat recomendation" do
    visit chat_recomendation_url(@chat_recomendation)
    click_on "Edit this chat recomendation", match: :first

    fill_in "Chat", with: @chat_recomendation.chat_id
    fill_in "Content", with: @chat_recomendation.content
    fill_in "Description", with: @chat_recomendation.description
    fill_in "Title", with: @chat_recomendation.title
    click_on "Update Chat recomendation"

    assert_text "Chat recomendation was successfully updated"
    click_on "Back"
  end

  test "should destroy Chat recomendation" do
    visit chat_recomendation_url(@chat_recomendation)
    click_on "Destroy this chat recomendation", match: :first

    assert_text "Chat recomendation was successfully destroyed"
  end
end
