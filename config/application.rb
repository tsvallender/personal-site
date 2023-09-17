# frozen_string_literal: true

require_relative "boot"
require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Soc
  class Application < Rails::Application
    config.load_defaults 7.0

    config.time_zone = "London"

    config.action_view.field_error_proc = proc do |html_tag, _instance|
      html_tag.gsub(/<(\w*) /, '<\1 class="field_with_errors"').html_safe
    end
  end
end
