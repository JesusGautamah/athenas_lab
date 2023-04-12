# frozen_string_literal: true

require "application_system_test_case"

class ChatRecipesTest < ApplicationSystemTestCase
  setup do
    @chat_recipe = chat_recipes(:one)
  end

  test "visiting the index" do
    visit chat_recipes_url
    assert_selector "h1", text: "Chat recipes"
  end

  test "should create chat recipe" do
    visit chat_recipes_url
    click_on "New chat recipe"

    fill_in "Chat", with: @chat_recipe.chat_id
    fill_in "Content", with: @chat_recipe.content
    fill_in "Description", with: @chat_recipe.description
    fill_in "Title", with: @chat_recipe.title
    click_on "Create Chat recipe"

    assert_text "Chat recipe was successfully created"
    click_on "Back"
  end

  test "should update Chat recipe" do
    visit chat_recipe_url(@chat_recipe)
    click_on "Edit this chat recipe", match: :first

    fill_in "Chat", with: @chat_recipe.chat_id
    fill_in "Content", with: @chat_recipe.content
    fill_in "Description", with: @chat_recipe.description
    fill_in "Title", with: @chat_recipe.title
    click_on "Update Chat recipe"

    assert_text "Chat recipe was successfully updated"
    click_on "Back"
  end

  test "should destroy Chat recipe" do
    visit chat_recipe_url(@chat_recipe)
    click_on "Destroy this chat recipe", match: :first

    assert_text "Chat recipe was successfully destroyed"
  end
end
