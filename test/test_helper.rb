# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  parallelize(workers: :number_of_processors)

  fixtures :all
end

class ActionDispatch::IntegrationTest
  def sign_in(user)
    post sessions_path, params: {
      username: user.username,
      password: 'tolkien-abercrombie-hobb-barker',
    }
    follow_redirect!
    assert_includes @response.body, I18n.t("sessions.logged_in")
  end
end
