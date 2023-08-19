require "test_helper"

class EmailConfirmationsControllerTest < ActionDispatch::IntegrationTest
  test "should confirm user account" do
    user = users(:unconfirmed_user)
    assert user.requires_confirmation?
    get confirm_email_url(
      email: user.email,
      confirmation_string: user.email_confirmation_string,
    )
    follow_redirect!
    assert_includes @response.body, I18n.t("email_confirmations.email_confirmed")
    user.reload
    assert_not user.requires_confirmation?
  end
end
