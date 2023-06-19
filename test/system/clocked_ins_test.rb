require "application_system_test_case"

class ClockedInsTest < ApplicationSystemTestCase
  setup do
    @clocked_in = clocked_ins(:one)
  end

  test "visiting the index" do
    visit clocked_ins_url
    assert_selector "h1", text: "Clocked ins"
  end

  test "should create clocked in" do
    visit clocked_ins_url
    click_on "New clocked in"

    fill_in "End date", with: @clocked_in.end_date
    fill_in "Start date", with: @clocked_in.start_date
    fill_in "User", with: @clocked_in.user_id
    click_on "Create Clocked in"

    assert_text "Clocked in was successfully created"
    click_on "Back"
  end

  test "should update Clocked in" do
    visit clocked_in_url(@clocked_in)
    click_on "Edit this clocked in", match: :first

    fill_in "End date", with: @clocked_in.end_date
    fill_in "Start date", with: @clocked_in.start_date
    fill_in "User", with: @clocked_in.user_id
    click_on "Update Clocked in"

    assert_text "Clocked in was successfully updated"
    click_on "Back"
  end

  test "should destroy Clocked in" do
    visit clocked_in_url(@clocked_in)
    click_on "Destroy this clocked in", match: :first

    assert_text "Clocked in was successfully destroyed"
  end
end
