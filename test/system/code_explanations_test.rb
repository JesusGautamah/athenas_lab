# frozen_string_literal: true

require "application_system_test_case"

class CodeExplanationsTest < ApplicationSystemTestCase
  setup do
    @code_explanation = code_explanations(:one)
  end

  test "visiting the index" do
    visit code_explanations_url
    assert_selector "h1", text: "Code explanations"
  end

  test "should create code explanation" do
    visit code_explanations_url
    click_on "New code explanation"

    fill_in "Description", with: @code_explanation.description
    fill_in "Message", with: @code_explanation.message_id
    fill_in "Title", with: @code_explanation.title
    click_on "Create Code explanation"

    assert_text "Code explanation was successfully created"
    click_on "Back"
  end

  test "should update Code explanation" do
    visit code_explanation_url(@code_explanation)
    click_on "Edit this code explanation", match: :first

    fill_in "Description", with: @code_explanation.description
    fill_in "Message", with: @code_explanation.message_id
    fill_in "Title", with: @code_explanation.title
    click_on "Update Code explanation"

    assert_text "Code explanation was successfully updated"
    click_on "Back"
  end

  test "should destroy Code explanation" do
    visit code_explanation_url(@code_explanation)
    click_on "Destroy this code explanation", match: :first

    assert_text "Code explanation was successfully destroyed"
  end
end
