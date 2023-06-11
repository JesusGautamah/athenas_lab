# frozen_string_literal: true

require "test_helper"

class BoardProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board_project = board_projects(:one)
  end

  test "should get index" do
    get board_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_board_project_url
    assert_response :success
  end

  test "should create board_project" do
    assert_difference("BoardProject.count") do
      post board_projects_url,
           params: { board_project: { chats_count: @board_project.chats_count, descriptiomn: @board_project.descriptiomn, ipynb: @board_project.ipynb, markdown: @board_project.markdown,
                                      title: @board_project.title } }
    end

    assert_redirected_to board_project_url(BoardProject.last)
  end

  test "should show board_project" do
    get board_project_url(@board_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_board_project_url(@board_project)
    assert_response :success
  end

  test "should update board_project" do
    patch board_project_url(@board_project),
          params: { board_project: { chats_count: @board_project.chats_count, descriptiomn: @board_project.descriptiomn, ipynb: @board_project.ipynb, markdown: @board_project.markdown,
                                     title: @board_project.title } }
    assert_redirected_to board_project_url(@board_project)
  end

  test "should destroy board_project" do
    assert_difference("BoardProject.count", -1) do
      delete board_project_url(@board_project)
    end

    assert_redirected_to board_projects_url
  end
end
