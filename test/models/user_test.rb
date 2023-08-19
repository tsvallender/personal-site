# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  include ActionMailer::TestHelper

  test "email must resemble an email" do
    user = users(:user)
    user.email = "foobar"
    assert_not user.valid?
  end

  test "a new user requires confirmation" do
    user = User.create(
      username: "gorkamorka",
      email: "gorka@morka.com",
      first_name: "Ork",
      last_names: "Boyz",
      password: "snotlings-are-for-squashing",
      password_confirmation: "snotlings-are-for-squashing",
    )
    assert user.requires_confirmation?
  end

  test "a new user requests confirmation" do
    assert_emails 1 do
      User.create(
        username: "gorkamorka",
        email: "gorka@morka.com",
        first_name: "Ork",
        last_names: "Boyz",
        password: "snotlings-are-for-squashing",
        password_confirmation: "snotlings-are-for-squashing",
      )
    end
  end
end
