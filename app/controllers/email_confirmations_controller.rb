# frozen_string_literal: true

class EmailConfirmationsController < ApplicationController
  skip_before_action :require_login, only: [:confirm]
  def confirm
    @user = User.find_by(email: params[:email])
    if params[:confirmation_string] == @user.email_confirmation_string
      @user.update(email_confirmation_string: nil)
      redirect_to new_session_path, notice: t(".email_confirmed")
    else
      redirect_to root_path, notice: t(".email_confirmation_failed")
    end
  end
end
