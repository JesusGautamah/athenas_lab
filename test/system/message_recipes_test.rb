# frozen_string_literal: true

require "application_system_test_case"

class MessageRecipesTest < ApplicationSystemTestCase
  setup do
    @message_recipe = message_recipes(:one)
  end

  test "visiting the index" do
    visit message_recipes_url
    assert_selector "h1", text: "Message recipes"
  end

  test "should create message recipe" do
    visit message_recipes_url
    click_on "New message recipe"

    fill_in "Content", with: @message_recipe.content
    fill_in "Description", with: @message_recipe.description
    fill_in "Message", with: @message_recipe.message_id
    fill_in "Title", with: @message_recipe.title
    click_on "Create Message recipe"

    assert_text "Message recipe was successfully created"
    click_on "Back"
  end

  test "should update Message recipe" do
    visit message_recipe_url(@message_recipe)
    click_on "Edit this message recipe", match: :first

    fill_in "Content", with: @message_recipe.content
    fill_in "Description", with: @message_recipe.description
    fill_in "Message", with: @message_recipe.message_id
    fill_in "Title", with: @message_recipe.title
    click_on "Update Message recipe"

    assert_text "Message recipe was successfully updated"
    click_on "Back"
  end

  test "should destroy Message recipe" do
    visit message_recipe_url(@message_recipe)
    click_on "Destroy this message recipe", match: :first

    assert_text "Message recipe was successfully destroyed"
  end
end
