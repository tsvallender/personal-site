# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :require_login

  def require_login
    redirect_to new_session_path unless helpers.logged_in?
  end
end
