require "application_system_test_case"

class RoomsTest < ApplicationSystemTestCase
  # setup do
  # end

  test "View main page" do
    sign_in_as users(:one)
    assert_selector "h1", text: "Chat Rooms"
  end
end
