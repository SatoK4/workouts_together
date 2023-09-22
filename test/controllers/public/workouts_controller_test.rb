require "test_helper"

class Public::WorkoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_workouts_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_workouts_edit_url
    assert_response :success
  end

  test "should get index" do
    get public_workouts_index_url
    assert_response :success
  end

  test "should get show" do
    get public_workouts_show_url
    assert_response :success
  end
end
