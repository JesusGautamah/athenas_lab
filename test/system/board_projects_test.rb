# frozen_string_literal: true

require "application_system_test_case"

class BoardProjectsTest < ApplicationSystemTestCase
  setup do
    @board_project = board_projects(:one)
  end

  test "visiting the index" do
    visit board_projects_url
    assert_selector "h1", text: "Board projects"
  end

  test "should create board project" do
    visit board_projects_url
    click_on "New board project"

    fill_in "Chats count", with: @board_project.chats_count
    fill_in "Descriptiomn", with: @board_project.descriptiomn
    fill_in "Ipynb", with: @board_project.ipynb
    fill_in "Markdown", with: @board_project.markdown
    fill_in "Title", with: @board_project.title
    click_on "Create Board project"

    assert_text "Board project was successfully created"
    click_on "Back"
  end

  test "should update Board project" do
    visit board_project_url(@board_project)
    click_on "Edit this board project", match: :first

    fill_in "Chats count", with: @board_project.chats_count
    fill_in "Descriptiomn", with: @board_project.descriptiomn
    fill_in "Ipynb", with: @board_project.ipynb
    fill_in "Markdown", with: @board_project.markdown
    fill_in "Title", with: @board_project.title
    click_on "Update Board project"

    assert_text "Board project was successfully updated"
    click_on "Back"
  end

  test "should destroy Board project" do
    visit board_project_url(@board_project)
    click_on "Destroy this board project", match: :first

    assert_text "Board project was successfully destroyed"
  end
end
