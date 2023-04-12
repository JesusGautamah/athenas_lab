# frozen_string_literal: true

require "application_system_test_case"

class ChatQuestionsTest < ApplicationSystemTestCase
  setup do
    @chat_question = chat_questions(:one)
  end

  test "visiting the index" do
    visit chat_questions_url
    assert_selector "h1", text: "Chat questions"
  end

  test "should create chat question" do
    visit chat_questions_url
    click_on "New chat question"

    fill_in "Answers", with: @chat_question.answers
    fill_in "Chat", with: @chat_question.chat_id
    fill_in "Question", with: @chat_question.question
    click_on "Create Chat question"

    assert_text "Chat question was successfully created"
    click_on "Back"
  end

  test "should update Chat question" do
    visit chat_question_url(@chat_question)
    click_on "Edit this chat question", match: :first

    fill_in "Answers", with: @chat_question.answers
    fill_in "Chat", with: @chat_question.chat_id
    fill_in "Question", with: @chat_question.question
    click_on "Update Chat question"

    assert_text "Chat question was successfully updated"
    click_on "Back"
  end

  test "should destroy Chat question" do
    visit chat_question_url(@chat_question)
    click_on "Destroy this chat question", match: :first

    assert_text "Chat question was successfully destroyed"
  end
end
