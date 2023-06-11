# frozen_string_literal: true

require "test_helper"

class ProjectUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_user = project_users(:one)
  end

  test "should get index" do
    get project_users_url
    assert_response :success
  end

  test "should get new" do
    get new_project_user_url
    assert_response :success
  end

  test "should create project_user" do
    assert_difference("ProjectUser.count") do
      post project_users_url, params: { project_user: { board_project_id: @project_user.board_project_id, role: @project_user.role, user_id: @project_user.user_id } }
    end

    assert_redirected_to project_user_url(ProjectUser.last)
  end

  test "should show project_user" do
    get project_user_url(@project_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_user_url(@project_user)
    assert_response :success
  end

  test "should update project_user" do
    patch project_user_url(@project_user), params: { project_user: { board_project_id: @project_user.board_project_id, role: @project_user.role, user_id: @project_user.user_id } }
    assert_redirected_to project_user_url(@project_user)
  end

  test "should destroy project_user" do
    assert_difference("ProjectUser.count", -1) do
      delete project_user_url(@project_user)
    end

    assert_redirected_to project_users_url
  end
end
