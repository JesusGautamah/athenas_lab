# frozen_string_literal: true

require "test_helper"

class MessageQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_question = message_questions(:one)
  end

  test "should get index" do
    get message_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_message_question_url
    assert_response :success
  end

  test "should create message_question" do
    assert_difference("MessageQuestion.count") do
      post message_questions_url,
           params: { message_question: { answers: @message_question.answers, message_id: @message_question.message_id, question: @message_question.question } }
    end

    assert_redirected_to message_question_url(MessageQuestion.last)
  end

  test "should show message_question" do
    get message_question_url(@message_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_question_url(@message_question)
    assert_response :success
  end

  test "should update message_question" do
    patch message_question_url(@message_question),
          params: { message_question: { answers: @message_question.answers, message_id: @message_question.message_id, question: @message_question.question } }
    assert_redirected_to message_question_url(@message_question)
  end

  test "should destroy message_question" do
    assert_difference("MessageQuestion.count", -1) do
      delete message_question_url(@message_question)
    end

    assert_redirected_to message_questions_url
  end
end
