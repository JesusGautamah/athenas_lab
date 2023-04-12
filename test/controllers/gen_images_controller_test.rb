# frozen_string_literal: true

require "test_helper"

class GenImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gen_image = gen_images(:one)
  end

  test "should get index" do
    get gen_images_url
    assert_response :success
  end

  test "should get new" do
    get new_gen_image_url
    assert_response :success
  end

  test "should create gen_image" do
    assert_difference("GenImage.count") do
      post gen_images_url, params: { gen_image: { description: @gen_image.description, message_id: @gen_image.message_id, title: @gen_image.title } }
    end

    assert_redirected_to gen_image_url(GenImage.last)
  end

  test "should show gen_image" do
    get gen_image_url(@gen_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_gen_image_url(@gen_image)
    assert_response :success
  end

  test "should update gen_image" do
    patch gen_image_url(@gen_image), params: { gen_image: { description: @gen_image.description, message_id: @gen_image.message_id, title: @gen_image.title } }
    assert_redirected_to gen_image_url(@gen_image)
  end

  test "should destroy gen_image" do
    assert_difference("GenImage.count", -1) do
      delete gen_image_url(@gen_image)
    end

    assert_redirected_to gen_images_url
  end
end
