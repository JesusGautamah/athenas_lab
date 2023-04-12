# frozen_string_literal: true

require "application_system_test_case"

class GenImagesTest < ApplicationSystemTestCase
  setup do
    @gen_image = gen_images(:one)
  end

  test "visiting the index" do
    visit gen_images_url
    assert_selector "h1", text: "Gen images"
  end

  test "should create gen image" do
    visit gen_images_url
    click_on "New gen image"

    fill_in "Description", with: @gen_image.description
    fill_in "Message", with: @gen_image.message_id
    fill_in "Title", with: @gen_image.title
    click_on "Create Gen image"

    assert_text "Gen image was successfully created"
    click_on "Back"
  end

  test "should update Gen image" do
    visit gen_image_url(@gen_image)
    click_on "Edit this gen image", match: :first

    fill_in "Description", with: @gen_image.description
    fill_in "Message", with: @gen_image.message_id
    fill_in "Title", with: @gen_image.title
    click_on "Update Gen image"

    assert_text "Gen image was successfully updated"
    click_on "Back"
  end

  test "should destroy Gen image" do
    visit gen_image_url(@gen_image)
    click_on "Destroy this gen image", match: :first

    assert_text "Gen image was successfully destroyed"
  end
end
