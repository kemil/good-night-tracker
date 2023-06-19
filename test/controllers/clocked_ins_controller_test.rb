require "test_helper"

class ClockedInsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clocked_in = clocked_ins(:one)
  end

  test "should get index" do
    get clocked_ins_url
    assert_response :success
  end

  test "should get new" do
    get new_clocked_in_url
    assert_response :success
  end

  test "should create clocked_in" do
    assert_difference("ClockedIn.count") do
      post clocked_ins_url, params: { clocked_in: { end_date: @clocked_in.end_date, start_date: @clocked_in.start_date, user_id: @clocked_in.user_id } }
    end

    assert_redirected_to clocked_in_url(ClockedIn.last)
  end

  test "should show clocked_in" do
    get clocked_in_url(@clocked_in)
    assert_response :success
  end

  test "should get edit" do
    get edit_clocked_in_url(@clocked_in)
    assert_response :success
  end

  test "should update clocked_in" do
    patch clocked_in_url(@clocked_in), params: { clocked_in: { end_date: @clocked_in.end_date, start_date: @clocked_in.start_date, user_id: @clocked_in.user_id } }
    assert_redirected_to clocked_in_url(@clocked_in)
  end

  test "should destroy clocked_in" do
    assert_difference("ClockedIn.count", -1) do
      delete clocked_in_url(@clocked_in)
    end

    assert_redirected_to clocked_ins_url
  end
end
