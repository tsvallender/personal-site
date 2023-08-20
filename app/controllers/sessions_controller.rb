# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  before_action :set_user, only: [:create]
  before_action :ensure_email_confirmed, only: [:create]

  def new; end

  def create
    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: t(".logged_in")
    else
      flash.now.alert = t(".login_fail")
      render :new, status: :unprocessable_entity
    end
  end

  def destroy_session
    reset_session
    redirect_to root_path, notice: t(".logged_out")
  end

  private

  def set_user
    @user = User.find_by(username: params[:username])
  end

  def ensure_email_confirmed
    return unless @user.requires_confirmation?

    flash.alert = t(".account_not_confirmed")
    redirect_to new_session_path
  end
end
