# frozen_string_literal: true

require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "cannot edit a user when not logged in" do
    get edit_user_path(users(:user))
    assert_redirected_to new_session_path
  end
end
