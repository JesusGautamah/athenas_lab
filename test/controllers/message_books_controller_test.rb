# frozen_string_literal: true

require "test_helper"

class MessageBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_book = message_books(:one)
  end

  test "should get index" do
    get message_books_url
    assert_response :success
  end

  test "should get new" do
    get new_message_book_url
    assert_response :success
  end

  test "should create message_book" do
    assert_difference("MessageBook.count") do
      post message_books_url,
           params: { message_book: { description: @message_book.description, message_id: @message_book.message_id, title: @message_book.title,
                                     year: @message_book.year } }
    end

    assert_redirected_to message_book_url(MessageBook.last)
  end

  test "should show message_book" do
    get message_book_url(@message_book)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_book_url(@message_book)
    assert_response :success
  end

  test "should update message_book" do
    patch message_book_url(@message_book),
          params: { message_book: { description: @message_book.description, message_id: @message_book.message_id, title: @message_book.title,
                                    year: @message_book.year } }
    assert_redirected_to message_book_url(@message_book)
  end

  test "should destroy message_book" do
    assert_difference("MessageBook.count", -1) do
      delete message_book_url(@message_book)
    end

    assert_redirected_to message_books_url
  end
end
