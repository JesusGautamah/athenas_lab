# frozen_string_literal: true

require "test_helper"

class ChatRecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chat_recipe = chat_recipes(:one)
  end

  test "should get index" do
    get chat_recipes_url
    assert_response :success
  end

  test "should get new" do
    get new_chat_recipe_url
    assert_response :success
  end

  test "should create chat_recipe" do
    assert_difference("ChatRecipe.count") do
      post chat_recipes_url,
           params: { chat_recipe: { chat_id: @chat_recipe.chat_id, content: @chat_recipe.content, description: @chat_recipe.description,
                                    title: @chat_recipe.title } }
    end

    assert_redirected_to chat_recipe_url(ChatRecipe.last)
  end

  test "should show chat_recipe" do
    get chat_recipe_url(@chat_recipe)
    assert_response :success
  end

  test "should get edit" do
    get edit_chat_recipe_url(@chat_recipe)
    assert_response :success
  end

  test "should update chat_recipe" do
    patch chat_recipe_url(@chat_recipe),
          params: { chat_recipe: { chat_id: @chat_recipe.chat_id, content: @chat_recipe.content, description: @chat_recipe.description,
                                   title: @chat_recipe.title } }
    assert_redirected_to chat_recipe_url(@chat_recipe)
  end

  test "should destroy chat_recipe" do
    assert_difference("ChatRecipe.count", -1) do
      delete chat_recipe_url(@chat_recipe)
    end

    assert_redirected_to chat_recipes_url
  end
end
