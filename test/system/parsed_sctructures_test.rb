# frozen_string_literal: true

require "application_system_test_case"

class ParsedSctructuresTest < ApplicationSystemTestCase
  setup do
    @parsed_sctructure = parsed_sctructures(:one)
  end

  test "visiting the index" do
    visit parsed_sctructures_url
    assert_selector "h1", text: "Parsed sctructures"
  end

  test "should create parsed sctructure" do
    visit parsed_sctructures_url
    click_on "New parsed sctructure"

    fill_in "Description", with: @parsed_sctructure.description
    fill_in "Gen structure", with: @parsed_sctructure.gen_structure
    fill_in "Message", with: @parsed_sctructure.message_id
    fill_in "Title", with: @parsed_sctructure.title
    click_on "Create Parsed sctructure"

    assert_text "Parsed sctructure was successfully created"
    click_on "Back"
  end

  test "should update Parsed sctructure" do
    visit parsed_sctructure_url(@parsed_sctructure)
    click_on "Edit this parsed sctructure", match: :first

    fill_in "Description", with: @parsed_sctructure.description
    fill_in "Gen structure", with: @parsed_sctructure.gen_structure
    fill_in "Message", with: @parsed_sctructure.message_id
    fill_in "Title", with: @parsed_sctructure.title
    click_on "Update Parsed sctructure"

    assert_text "Parsed sctructure was successfully updated"
    click_on "Back"
  end

  test "should destroy Parsed sctructure" do
    visit parsed_sctructure_url(@parsed_sctructure)
    click_on "Destroy this parsed sctructure", match: :first

    assert_text "Parsed sctructure was successfully destroyed"
  end
end
