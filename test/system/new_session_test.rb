# frozen_string_literal: true

require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  setup do
    @user = users(:user)
  end

  test "can log in and log out existing user" do
    visit new_session_path
    fill_in "username", with: @user.username
    fill_in "password", with: "tolkien-abercrombie-hobb-barker"
    click_button I18n.t("log_in")
    assert_text I18n.t("sessions.logged_in")
    click_link I18n.t("log_out")
    assert_text I18n.t("sessions.logged_out")
  end
end
