# frozen_string_literal: true

require "application_system_test_case"

class MessageQuestionsTest < ApplicationSystemTestCase
  setup do
    @message_question = message_questions(:one)
  end

  test "visiting the index" do
    visit message_questions_url
    assert_selector "h1", text: "Message questions"
  end

  test "should create message question" do
    visit message_questions_url
    click_on "New message question"

    fill_in "Answers", with: @message_question.answers
    fill_in "Message", with: @message_question.message_id
    fill_in "Question", with: @message_question.question
    click_on "Create Message question"

    assert_text "Message question was successfully created"
    click_on "Back"
  end

  test "should update Message question" do
    visit message_question_url(@message_question)
    click_on "Edit this message question", match: :first

    fill_in "Answers", with: @message_question.answers
    fill_in "Message", with: @message_question.message_id
    fill_in "Question", with: @message_question.question
    click_on "Update Message question"

    assert_text "Message question was successfully updated"
    click_on "Back"
  end

  test "should destroy Message question" do
    visit message_question_url(@message_question)
    click_on "Destroy this message question", match: :first

    assert_text "Message question was successfully destroyed"
  end
end
