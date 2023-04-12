# frozen_string_literal: true

require "application_system_test_case"

class MessageBooksTest < ApplicationSystemTestCase
  setup do
    @message_book = message_books(:one)
  end

  test "visiting the index" do
    visit message_books_url
    assert_selector "h1", text: "Message books"
  end

  test "should create message book" do
    visit message_books_url
    click_on "New message book"

    fill_in "Description", with: @message_book.description
    fill_in "Message", with: @message_book.message_id
    fill_in "Title", with: @message_book.title
    fill_in "Year", with: @message_book.year
    click_on "Create Message book"

    assert_text "Message book was successfully created"
    click_on "Back"
  end

  test "should update Message book" do
    visit message_book_url(@message_book)
    click_on "Edit this message book", match: :first

    fill_in "Description", with: @message_book.description
    fill_in "Message", with: @message_book.message_id
    fill_in "Title", with: @message_book.title
    fill_in "Year", with: @message_book.year
    click_on "Update Message book"

    assert_text "Message book was successfully updated"
    click_on "Back"
  end

  test "should destroy Message book" do
    visit message_book_url(@message_book)
    click_on "Destroy this message book", match: :first

    assert_text "Message book was successfully destroyed"
  end
end
