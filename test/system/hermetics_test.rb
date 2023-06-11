require "application_system_test_case"

class HermeticsTest < ApplicationSystemTestCase
  setup do
    @hermetic = hermetics(:one)
  end

  test "visiting the index" do
    visit hermetics_url
    assert_selector "h1", text: "Hermetics"
  end

  test "should create hermetic" do
    visit hermetics_url
    click_on "New hermetic"

    fill_in "Laws", with: @hermetic.laws
    click_on "Create Hermetic"

    assert_text "Hermetic was successfully created"
    click_on "Back"
  end

  test "should update Hermetic" do
    visit hermetic_url(@hermetic)
    click_on "Edit this hermetic", match: :first

    fill_in "Laws", with: @hermetic.laws
    click_on "Update Hermetic"

    assert_text "Hermetic was successfully updated"
    click_on "Back"
  end

  test "should destroy Hermetic" do
    visit hermetic_url(@hermetic)
    click_on "Destroy this hermetic", match: :first

    assert_text "Hermetic was successfully destroyed"
  end
end
