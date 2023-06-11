require "application_system_test_case"

class ConductorsTest < ApplicationSystemTestCase
  setup do
    @conductor = conductors(:one)
  end

  test "visiting the index" do
    visit conductors_url
    assert_selector "h1", text: "Conductors"
  end

  test "should create conductor" do
    visit conductors_url
    click_on "New conductor"

    fill_in "Board project", with: @conductor.board_project_id
    fill_in "Cast", with: @conductor.cast
    fill_in "Memory", with: @conductor.memory
    fill_in "Scene", with: @conductor.scene_id
    fill_in "Subconcious", with: @conductor.subconcious
    click_on "Create Conductor"

    assert_text "Conductor was successfully created"
    click_on "Back"
  end

  test "should update Conductor" do
    visit conductor_url(@conductor)
    click_on "Edit this conductor", match: :first

    fill_in "Board project", with: @conductor.board_project_id
    fill_in "Cast", with: @conductor.cast
    fill_in "Memory", with: @conductor.memory
    fill_in "Scene", with: @conductor.scene_id
    fill_in "Subconcious", with: @conductor.subconcious
    click_on "Update Conductor"

    assert_text "Conductor was successfully updated"
    click_on "Back"
  end

  test "should destroy Conductor" do
    visit conductor_url(@conductor)
    click_on "Destroy this conductor", match: :first

    assert_text "Conductor was successfully destroyed"
  end
end
