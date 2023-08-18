# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # TODO: Add email confirmation workflow
      session[:user_id] = @user.id
      redirect_to root_path, notice: t(".account_created")
    else
      render :new
    end
  end

  def show
    @user = User.find_by(username: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :password,
      :password_confirmation,
      :first_name,
      :last_names,
    )
  end
end
