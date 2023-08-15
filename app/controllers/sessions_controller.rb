# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(username: params[:username])

    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user, notice: t(".logged_in")
    else
      redirect_to root_path, notice: t(".login_fail")
    end
  end

  def destroy_session
    reset_session
    redirect_to root_path, notice: t(".logged_out")
  end
end
