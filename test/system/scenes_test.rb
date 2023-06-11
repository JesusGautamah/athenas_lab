require "application_system_test_case"

class ScenesTest < ApplicationSystemTestCase
  setup do
    @scene = scenes(:one)
  end

  test "visiting the index" do
    visit scenes_url
    assert_selector "h1", text: "Scenes"
  end

  test "should create scene" do
    visit scenes_url
    click_on "New scene"

    fill_in "Actual point", with: @scene.actual_point
    fill_in "Board project", with: @scene.board_project_id
    fill_in "Initial point", with: @scene.initial_point
    fill_in "Objective point", with: @scene.objective_point
    fill_in "Past points", with: @scene.past_points
    click_on "Create Scene"

    assert_text "Scene was successfully created"
    click_on "Back"
  end

  test "should update Scene" do
    visit scene_url(@scene)
    click_on "Edit this scene", match: :first

    fill_in "Actual point", with: @scene.actual_point
    fill_in "Board project", with: @scene.board_project_id
    fill_in "Initial point", with: @scene.initial_point
    fill_in "Objective point", with: @scene.objective_point
    fill_in "Past points", with: @scene.past_points
    click_on "Update Scene"

    assert_text "Scene was successfully updated"
    click_on "Back"
  end

  test "should destroy Scene" do
    visit scene_url(@scene)
    click_on "Destroy this scene", match: :first

    assert_text "Scene was successfully destroyed"
  end
end
