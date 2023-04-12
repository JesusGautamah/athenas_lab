# frozen_string_literal: true

require "test_helper"

class MessageRecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_recipe = message_recipes(:one)
  end

  test "should get index" do
    get message_recipes_url
    assert_response :success
  end

  test "should get new" do
    get new_message_recipe_url
    assert_response :success
  end

  test "should create message_recipe" do
    assert_difference("MessageRecipe.count") do
      post message_recipes_url,
           params: { message_recipe: { content: @message_recipe.content, description: @message_recipe.description, message_id: @message_recipe.message_id,
                                       title: @message_recipe.title } }
    end

    assert_redirected_to message_recipe_url(MessageRecipe.last)
  end

  test "should show message_recipe" do
    get message_recipe_url(@message_recipe)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_recipe_url(@message_recipe)
    assert_response :success
  end

  test "should update message_recipe" do
    patch message_recipe_url(@message_recipe),
          params: { message_recipe: { content: @message_recipe.content, description: @message_recipe.description, message_id: @message_recipe.message_id,
                                      title: @message_recipe.title } }
    assert_redirected_to message_recipe_url(@message_recipe)
  end

  test "should destroy message_recipe" do
    assert_difference("MessageRecipe.count", -1) do
      delete message_recipe_url(@message_recipe)
    end

    assert_redirected_to message_recipes_url
  end
end
