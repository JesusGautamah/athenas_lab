# frozen_string_literal: true

require "application_system_test_case"

class ChatBooksTest < ApplicationSystemTestCase
  setup do
    @chat_book = chat_books(:one)
  end

  test "visiting the index" do
    visit chat_books_url
    assert_selector "h1", text: "Chat books"
  end

  test "should create chat book" do
    visit chat_books_url
    click_on "New chat book"

    fill_in "Chat", with: @chat_book.chat_id
    fill_in "Description", with: @chat_book.description
    fill_in "Title", with: @chat_book.title
    fill_in "Year", with: @chat_book.year
    click_on "Create Chat book"

    assert_text "Chat book was successfully created"
    click_on "Back"
  end

  test "should update Chat book" do
    visit chat_book_url(@chat_book)
    click_on "Edit this chat book", match: :first

    fill_in "Chat", with: @chat_book.chat_id
    fill_in "Description", with: @chat_book.description
    fill_in "Title", with: @chat_book.title
    fill_in "Year", with: @chat_book.year
    click_on "Update Chat book"

    assert_text "Chat book was successfully updated"
    click_on "Back"
  end

  test "should destroy Chat book" do
    visit chat_book_url(@chat_book)
    click_on "Destroy this chat book", match: :first

    assert_text "Chat book was successfully destroyed"
  end
end
