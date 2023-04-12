# frozen_string_literal: true

require "test_helper"

class ParsedSctructuresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parsed_sctructure = parsed_sctructures(:one)
  end

  test "should get index" do
    get parsed_sctructures_url
    assert_response :success
  end

  test "should get new" do
    get new_parsed_sctructure_url
    assert_response :success
  end

  test "should create parsed_sctructure" do
    assert_difference("ParsedSctructure.count") do
      post parsed_sctructures_url,
           params: { parsed_sctructure: { description: @parsed_sctructure.description, gen_structure: @parsed_sctructure.gen_structure,
                                          message_id: @parsed_sctructure.message_id, title: @parsed_sctructure.title } }
    end

    assert_redirected_to parsed_sctructure_url(ParsedSctructure.last)
  end

  test "should show parsed_sctructure" do
    get parsed_sctructure_url(@parsed_sctructure)
    assert_response :success
  end

  test "should get edit" do
    get edit_parsed_sctructure_url(@parsed_sctructure)
    assert_response :success
  end

  test "should update parsed_sctructure" do
    patch parsed_sctructure_url(@parsed_sctructure),
          params: { parsed_sctructure: { description: @parsed_sctructure.description, gen_structure: @parsed_sctructure.gen_structure,
                                         message_id: @parsed_sctructure.message_id, title: @parsed_sctructure.title } }
    assert_redirected_to parsed_sctructure_url(@parsed_sctructure)
  end

  test "should destroy parsed_sctructure" do
    assert_difference("ParsedSctructure.count", -1) do
      delete parsed_sctructure_url(@parsed_sctructure)
    end

    assert_redirected_to parsed_sctructures_url
  end
end
