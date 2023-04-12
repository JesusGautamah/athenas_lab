# frozen_string_literal: true

require "application_system_test_case"

class GenSpreadsheetsTest < ApplicationSystemTestCase
  setup do
    @gen_spreadsheet = gen_spreadsheets(:one)
  end

  test "visiting the index" do
    visit gen_spreadsheets_url
    assert_selector "h1", text: "Gen spreadsheets"
  end

  test "should create gen spreadsheet" do
    visit gen_spreadsheets_url
    click_on "New gen spreadsheet"

    fill_in "Description", with: @gen_spreadsheet.description
    fill_in "Message", with: @gen_spreadsheet.message_id
    fill_in "Title", with: @gen_spreadsheet.title
    click_on "Create Gen spreadsheet"

    assert_text "Gen spreadsheet was successfully created"
    click_on "Back"
  end

  test "should update Gen spreadsheet" do
    visit gen_spreadsheet_url(@gen_spreadsheet)
    click_on "Edit this gen spreadsheet", match: :first

    fill_in "Description", with: @gen_spreadsheet.description
    fill_in "Message", with: @gen_spreadsheet.message_id
    fill_in "Title", with: @gen_spreadsheet.title
    click_on "Update Gen spreadsheet"

    assert_text "Gen spreadsheet was successfully updated"
    click_on "Back"
  end

  test "should destroy Gen spreadsheet" do
    visit gen_spreadsheet_url(@gen_spreadsheet)
    click_on "Destroy this gen spreadsheet", match: :first

    assert_text "Gen spreadsheet was successfully destroyed"
  end
end
