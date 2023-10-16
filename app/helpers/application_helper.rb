# frozen_string_literal: true

module ApplicationHelper
  def logged_in?
    session[:user_id].present?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if logged_in?
  end

  def update_flash
    turbo_stream.replace "flash_wrapper" do
      render "shared/flash"
    end
  end

  def updated_at(object)
    return "" if object.created_at == object.updated_at

    object.updated_at.strftime("%Y-%m-%d %H:%M")
  end
end
