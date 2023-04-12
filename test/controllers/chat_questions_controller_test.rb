# frozen_string_literal: true

require "test_helper"

class ChatQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chat_question = chat_questions(:one)
  end

  test "should get index" do
    get chat_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_chat_question_url
    assert_response :success
  end

  test "should create chat_question" do
    assert_difference("ChatQuestion.count") do
      post chat_questions_url,
           params: { chat_question: { answers: @chat_question.answers, chat_id: @chat_question.chat_id, question: @chat_question.question } }
    end

    assert_redirected_to chat_question_url(ChatQuestion.last)
  end

  test "should show chat_question" do
    get chat_question_url(@chat_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_chat_question_url(@chat_question)
    assert_response :success
  end

  test "should update chat_question" do
    patch chat_question_url(@chat_question),
          params: { chat_question: { answers: @chat_question.answers, chat_id: @chat_question.chat_id, question: @chat_question.question } }
    assert_redirected_to chat_question_url(@chat_question)
  end

  test "should destroy chat_question" do
    assert_difference("ChatQuestion.count", -1) do
      delete chat_question_url(@chat_question)
    end

    assert_redirected_to chat_questions_url
  end
end
