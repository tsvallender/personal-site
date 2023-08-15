require "application_system_test_case"

class RegisterUsersTest < ApplicationSystemTestCase
  test "can register a new user" do
    visit new_user_path
    fill_in "user_username", with: "legolas"
    fill_in "user_email", with: "legolas@example.com"
    fill_in "user_first_name", with: "Legolas"
    fill_in "user_last_names", with: "Greenleaf"
    fill_in "user_password", with: "mirkwood-mordor-shire"
    fill_in "user_password_confirmation", with: "mirkwood-mordor-shire"
    click_button I18n.t("users.new.register")
    assert_text I18n.t("users.account_created")
  end
end
