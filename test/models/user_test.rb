require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "email must resemble an email" do
    user = users(:user)
    user.email = "foobar"
    assert_not user.valid?
  end
end
