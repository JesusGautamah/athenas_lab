# frozen_string_literal: true

require "test_helper"

class GenSpreadsheetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gen_spreadsheet = gen_spreadsheets(:one)
  end

  test "should get index" do
    get gen_spreadsheets_url
    assert_response :success
  end

  test "should get new" do
    get new_gen_spreadsheet_url
    assert_response :success
  end

  test "should create gen_spreadsheet" do
    assert_difference("GenSpreadsheet.count") do
      post gen_spreadsheets_url,
           params: { gen_spreadsheet: { description: @gen_spreadsheet.description, message_id: @gen_spreadsheet.message_id, title: @gen_spreadsheet.title } }
    end

    assert_redirected_to gen_spreadsheet_url(GenSpreadsheet.last)
  end

  test "should show gen_spreadsheet" do
    get gen_spreadsheet_url(@gen_spreadsheet)
    assert_response :success
  end

  test "should get edit" do
    get edit_gen_spreadsheet_url(@gen_spreadsheet)
    assert_response :success
  end

  test "should update gen_spreadsheet" do
    patch gen_spreadsheet_url(@gen_spreadsheet),
          params: { gen_spreadsheet: { description: @gen_spreadsheet.description, message_id: @gen_spreadsheet.message_id, title: @gen_spreadsheet.title } }
    assert_redirected_to gen_spreadsheet_url(@gen_spreadsheet)
  end

  test "should destroy gen_spreadsheet" do
    assert_difference("GenSpreadsheet.count", -1) do
      delete gen_spreadsheet_url(@gen_spreadsheet)
    end

    assert_redirected_to gen_spreadsheets_url
  end
end
