# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: t(".account_created")
    else
      flash.now.alert = t(".create_failed")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    head :forbidden and return unless @user == helpers.current_user
  end

  def update
    @user = User.find_by(username: params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: t(".account_updated")
    else
      flash.now.alert = t(".update_failed")
      render :edit, status: :unprocessable_entity
    end
  end

  def show; end

  private

  def set_user
    @user = User.find_by(username: params[:id])
  end

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
