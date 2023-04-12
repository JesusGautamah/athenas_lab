# frozen_string_literal: true

require "test_helper"

class ChatBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chat_book = chat_books(:one)
  end

  test "should get index" do
    get chat_books_url
    assert_response :success
  end

  test "should get new" do
    get new_chat_book_url
    assert_response :success
  end

  test "should create chat_book" do
    assert_difference("ChatBook.count") do
      post chat_books_url,
           params: { chat_book: { chat_id: @chat_book.chat_id, description: @chat_book.description, title: @chat_book.title, year: @chat_book.year } }
    end

    assert_redirected_to chat_book_url(ChatBook.last)
  end

  test "should show chat_book" do
    get chat_book_url(@chat_book)
    assert_response :success
  end

  test "should get edit" do
    get edit_chat_book_url(@chat_book)
    assert_response :success
  end

  test "should update chat_book" do
    patch chat_book_url(@chat_book),
          params: { chat_book: { chat_id: @chat_book.chat_id, description: @chat_book.description, title: @chat_book.title, year: @chat_book.year } }
    assert_redirected_to chat_book_url(@chat_book)
  end

  test "should destroy chat_book" do
    assert_difference("ChatBook.count", -1) do
      delete chat_book_url(@chat_book)
    end

    assert_redirected_to chat_books_url
  end
end
