require "test_helper"

class HermeticsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hermetic = hermetics(:one)
  end

  test "should get index" do
    get hermetics_url
    assert_response :success
  end

  test "should get new" do
    get new_hermetic_url
    assert_response :success
  end

  test "should create hermetic" do
    assert_difference("Hermetic.count") do
      post hermetics_url, params: { hermetic: { laws: @hermetic.laws } }
    end

    assert_redirected_to hermetic_url(Hermetic.last)
  end

  test "should show hermetic" do
    get hermetic_url(@hermetic)
    assert_response :success
  end

  test "should get edit" do
    get edit_hermetic_url(@hermetic)
    assert_response :success
  end

  test "should update hermetic" do
    patch hermetic_url(@hermetic), params: { hermetic: { laws: @hermetic.laws } }
    assert_redirected_to hermetic_url(@hermetic)
  end

  test "should destroy hermetic" do
    assert_difference("Hermetic.count", -1) do
      delete hermetic_url(@hermetic)
    end

    assert_redirected_to hermetics_url
  end
end
